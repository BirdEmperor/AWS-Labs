const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
    region: process.env.AWS_REGION,
    apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
    const params = {
        TableName: process.env.TABLE_NAME
    };
    dynamodb.scan(params, (err, data) => {
        if (err) {
            console.log(err);
            callback(err);
        } else { const courses = data.Items.map(item => {
            return {
                id: item.id.S,
                title: item.Title.S,
                authors_Id: item.Authors_Id.S
            };
        });
            callback(null, courses);
        }
    });
};
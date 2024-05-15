const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: process.env.AWS_REGION,
  apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
  const params = {
    Item: {
      id: {
        S: event.id
      },
      Title: {
        S: event.title
      },
      Authors_Id: {
        S: event.authors_Id
      }
    },
    TableName: process.env.TABLE_NAME
  };
  dynamodb.putItem(params, (err, data) => {
    if (err) {
      console.log(err);
      callback(err);
    } else {
      callback(null, {
        id: params.Item.id.S,
        Title: params.Item.Title.S,
        Authors_Id: params.Item.Authors_Id.S,
      });
    }
  });
};
module Fog
  module AWS
    class DataPipeline

      class Real

        # Queries a pipeline for the names of objects that match a specified set of conditions.
        # http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_DescribeObjects.html
        # ==== Parameters
        # * PipelineId <~String> - The ID of the pipeline
        # * ObjectIds <~Array> - Identifiers of the pipeline objects that contain the definitions
        #                        to be described. You can pass as many as 25 identifiers in a
        #                        single call to DescribeObjects.
        # * Options <~Hash> - A list of additional options described in the API docs.
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        def describe_objects(id, objectIds, opts={})
          params = {
            'pipelineId' => id,
            'objectIds' => objectIds,
          }.merge(opts)

          response = request({
            :body => Fog::JSON.encode(params),
            :headers => { 'X-Amz-Target' => 'DataPipeline.DescribeObjects' },
          })

          Fog::JSON.decode(response.body)
        end

      end

      class Mock
        def describe_objects(id, objects, opts={})
          Fog::Mock.not_implemented
        end
      end

    end
  end
end

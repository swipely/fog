module Fog
  module AWS
    class DataPipeline

      class Real

        # Queries a pipeline for the names of objects that match a specified set of conditions.
        # http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_QueryObjects.html
        # ==== Parameters
        # * pipelineId <~String> - The ID of the pipeline
        # * sphere <~String> - Specifies whether the query applies to components or instances.
        #                      Allowable values: COMPONENT, INSTANCE, ATTEMPT.
        # * Options <~Hash> - (optional):
        #   * 'Limit'<~Integer> - Maximum number of objects to return, default 100.
        #   * 'Marker'<~String> - The starting point for the results to be returned.
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        def query_objects(id, sphere, options={})
          params = {
            'pipelineId' => id,
            'sphere' => sphere,
          }.merge(options)

          response = request({
            :body => Fog::JSON.encode(params),
            :headers => { 'X-Amz-Target' => 'DataPipeline.QueryObjects' },
          })

          Fog::JSON.decode(response.body)
        end

      end

      class Mock
        def query_objects(id, objects)
          Fog::Mock.not_implemented
        end
      end

    end
  end
end


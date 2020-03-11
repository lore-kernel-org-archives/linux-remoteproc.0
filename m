Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 11 Mar 2020 10:26:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 3/5] firmware: xilinx: Add zynqmp_get_node_status API
Message-ID: <20200311162624.GA32395@xps15>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-4-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582566751-13118-4-git-send-email-ben.levinsky@xilinx.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Ben,

On Mon, Feb 24, 2020 at 09:52:29AM -0800, Ben Levinsky wrote:
> This patch adds a new API to provide access to the
> current power state of a sub-system on Zynqmp sub-system.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>

Patches 1 to 3 look good to me but they will need an R-b from Michal Simek
before it is possible to move foward with them.

Thanks,
Mathieu

> ---
>  drivers/firmware/xilinx/zynqmp.c     | 42 ++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  3 +++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 486dcb1..98e35d4 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -725,6 +725,47 @@ static int zynqmp_pm_request_wakeup(const u32 node,
>  }
>  
>  /**
> + * zynqmp_pm_get_node_status - PM call to request a node's current power state
> + * @node:		ID of the component or sub-system in question
> + * @status:		Current operating state of the requested node
> + * @requirements:	Current requirements asserted on the node,
> + *			used for slave nodes only.
> + * @usage:		Usage information, used for slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> +				     u32 *const requirements, u32 *const usage)
> +{
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	if (!status)
> +		return -EINVAL;
> +
> +	ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, node, 0, 0,
> +				  0, ret_payload);
> +	if (ret_payload[0] == XST_PM_SUCCESS) {
> +		*status = ret_payload[1];
> +		if (requirements)
> +			*requirements = ret_payload[2];
> +		if (usage)
> +			*usage = ret_payload[3];
> +	}
> +
> +	return ret;
> +}
> +
> +/**
>   * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
>   * @node:		Node ID of the slave
>   * @capabilities:	Requested capabilities of the slave
> @@ -769,6 +810,7 @@ static const struct zynqmp_eemi_ops eemi_ops = {
>  	.set_requirement = zynqmp_pm_set_requirement,
>  	.fpga_load = zynqmp_pm_fpga_load,
>  	.fpga_get_status = zynqmp_pm_fpga_get_status,
> +	.get_node_status = zynqmp_pm_get_node_status,
>  };
>  
>  /**
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 0a68849..fb4efc9 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -62,6 +62,7 @@
>  
>  enum pm_api_id {
>  	PM_GET_API_VERSION = 1,
> +	PM_GET_NODE_STATUS = 3,
>  	PM_REQUEST_NODE = 13,
>  	PM_RELEASE_NODE,
>  	PM_SET_REQUIREMENT,
> @@ -309,6 +310,8 @@ struct zynqmp_pm_query_data {
>  struct zynqmp_eemi_ops {
>  	int (*get_api_version)(u32 *version);
>  	int (*get_chipid)(u32 *idcode, u32 *version);
> +	int (*get_node_status)(const u32 node, u32 *const status,
> +			       u32 *const requirements, u32 *const usage);
>  	int (*fpga_load)(const u64 address, const u32 size, const u32 flags);
>  	int (*fpga_get_status)(u32 *value);
>  	int (*query_data)(struct zynqmp_pm_query_data qdata, u32 *out);
> -- 
> 2.7.4
> 

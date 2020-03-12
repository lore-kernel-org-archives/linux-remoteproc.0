Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH 2/5] firmware: xilinx: Add shutdown/wakeup APIs
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-3-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <1a88df22-b4f3-215a-1232-4e94cf4a8929@xilinx.com>
Date: Thu, 12 Mar 2020 08:34:04 +0100
MIME-Version: 1.0
In-Reply-To: <1582566751-13118-3-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 24. 02. 20 18:52, Ben Levinsky wrote:
> Add shutdown/wakeup a resource eemi operations to shutdown
> or bringup a resource.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  8 ++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 20e4574..486dcb1 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -692,6 +692,39 @@ static int zynqmp_pm_release_node(const u32 node)
>  }
>  
>  /**
> + * zynqmp_pm_force_powerdown - PM call to request for another PU or subsystem to
> + *             be powered down forcefully
> + * @target:    Node ID of the targeted PU or subsystem
> + * @ack:   Flag to specify whether acknowledge is requested
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_force_powerdown(const u32 target,
> +				   const enum zynqmp_pm_request_ack ack)
> +{
> +	return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, target, ack, 0, 0, NULL);
> +}
> +
> +/**
> + * zynqmp_pm_request_wakeup - PM call to wake up selected master or subsystem
> + * @node:  Node ID of the master or subsystem
> + * @set_addr:  Specifies whether the address argument is relevant
> + * @address:   Address from which to resume when woken up
> + * @ack:   Flag to specify whether acknowledge requested
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_request_wakeup(const u32 node,
> +				   const bool set_addr,
> +				   const u64 address,
> +				   const enum zynqmp_pm_request_ack ack)
> +{
> +	/* set_addr flag is encoded into 1st bit of address */
> +	return zynqmp_pm_invoke_fn(PM_REQUEST_WAKEUP, node, address | set_addr,
> +					address >> 32, ack, NULL);
> +}
> +
> +/**
>   * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
>   * @node:		Node ID of the slave
>   * @capabilities:	Requested capabilities of the slave
> @@ -731,6 +764,8 @@ static const struct zynqmp_eemi_ops eemi_ops = {
>  	.set_suspend_mode = zynqmp_pm_set_suspend_mode,
>  	.request_node = zynqmp_pm_request_node,
>  	.release_node = zynqmp_pm_release_node,
> +	.force_powerdown = zynqmp_pm_force_powerdown,
> +	.request_wakeup = zynqmp_pm_request_wakeup,
>  	.set_requirement = zynqmp_pm_set_requirement,
>  	.fpga_load = zynqmp_pm_fpga_load,
>  	.fpga_get_status = zynqmp_pm_fpga_get_status,
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index b8ca118..0a68849 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -82,6 +82,8 @@ enum pm_api_id {
>  	PM_CLOCK_GETRATE,
>  	PM_CLOCK_SETPARENT,
>  	PM_CLOCK_GETPARENT,
> +	PM_FORCE_POWERDOWN = 8,
> +	PM_REQUEST_WAKEUP = 10,
>  	PM_FEATURE_CHECK = 63,
>  	PM_API_MAX,
>  };
> @@ -330,6 +332,12 @@ struct zynqmp_eemi_ops {
>  			    const u32 qos,
>  			    const enum zynqmp_pm_request_ack ack);
>  	int (*release_node)(const u32 node);
> +	int (*force_powerdown)(const u32 target,
> +				const enum zynqmp_pm_request_ack ack);
> +	int (*request_wakeup)(const u32 node,
> +				const bool set_addr,
> +				const u64 address,
> +				const enum zynqmp_pm_request_ack ack);
>  	int (*set_requirement)(const u32 node,
>  			       const u32 capabilities,
>  			       const u32 qos,
> 

Please work with Jolly on this one. Based on her discussion with Greg we
should stop to call eemi ops from drivers. Take a look at
https://lkml.org/lkml/2020/3/6/1128

This will affect at least patch 5/5.

Thanks,
Michal

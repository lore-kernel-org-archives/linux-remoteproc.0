Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH v3 3/5] firmware: xilinx: Add RPU configuration APIs
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
 <1587421629-914-4-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <18cf27ff-5175-bff1-d1d8-5ef077d4202a@xilinx.com>
Date: Tue, 21 Apr 2020 07:59:16 +0200
MIME-Version: 1.0
In-Reply-To: <1587421629-914-4-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 21. 04. 20 0:27, Ben Levinsky wrote:
> This patch adds APIs to provide access and a configuration interface
> to the current power state of a sub-system on Zynqmp sub-system.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> changes since v2:
> - add xilinx-related platform mgmt fn's instead of wrapping around
> 	function pointer in xilinx eemi ops struct
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 101 +++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h |  30 +++++++++++
>  2 files changed, 131 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index b0d140f..e0a906e 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -845,6 +845,63 @@ int zynqmp_pm_release_node(const u32 node)
>  EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
>  
>  /**
> + * zynqmp_pm_get_rpu_mode() - Get RPU mode
> + * @node_id:	Node ID of the device
> + * @arg1:	Argument 1 to requested IOCTL call
> + * @arg2:	Argument 2 to requested IOCTL call
> + * @out:	Returned output value
> + *
> + * Return: Returns RPU mode

ditto.

> + */
> +int zynqmp_pm_get_rpu_mode(u32 node_id,
> +			u32 arg1, u32 arg2, u32 *out)
> +{
> +	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
> +				IOCTL_GET_RPU_OPER_MODE, 0, 0, out);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_mode);
> +
> +/**
> + * zynqmp_pm_set_rpu_mode() - Set RPU mode
> + * @node_id:	Node ID of the device
> + * @ioctl_id:	ID of the requested IOCTL
> + * @arg2:	Argument 2 to requested IOCTL call
> + * @out:	Returned output value
> + *
> + * This function is used to set RPU mode.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +int zynqmp_pm_set_rpu_mode(u32 node_id,
> +			u32 arg1, u32 arg2, u32 *out)
> +{
> +	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
> +				IOCTL_SET_RPU_OPER_MODE, 0, 0, out);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
> +
> +/**
> + * zynqmp_pm_tcm_comb_config - configure TCM
> + * @node_id:	Node ID of the device
> + * @arg1:	Argument 1 to requested IOCTL call
> + * @arg2:	Argument 2 to requested IOCTL call
> + * @out:	Returned output value
> + *
> + * This function is used to set RPU mode.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +int zynqmp_pm_set_tcm_config(u32 node_id,
> +			u32 arg1, u32 arg2, u32 *out)
> +{
> +	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
> +				IOCTL_TCM_COMB_CONFIG, 0, 0, out);
> +
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
> +
> +

double space here.

> +/**
>   * zynqmp_pm_force_powerdown - PM call to request for another PU or subsystem to
>   *             be powered down forcefully
>   * @target:    Node ID of the targeted PU or subsystem
> @@ -880,6 +937,50 @@ int zynqmp_pm_request_wakeup(const u32 node,
>  EXPORT_SYMBOL_GPL(zynqmp_pm_request_wakeup);
>  
>  /**
> + * zynqmp_pm_get_node_status - PM call to request a node's current power state
> + * @node:      ID of the component or sub-system in question
> + * @status:        Current operating state of the requested node
> + * @requirements:  Current requirements asserted on the node,
> + *         used for slave nodes only.
> + * @usage:     Usage information, used for slave nodes only:
> + *         PM_USAGE_NO_MASTER  - No master is currently using
> + *                       the node
> + *         PM_USAGE_CURRENT_MASTER - Only requesting master is
> + *                       currently using the node
> + *         PM_USAGE_OTHER_MASTER   - Only other masters are
> + *                       currently using the node
> + *         PM_USAGE_BOTH_MASTERS   - Both the current and at least
> + *                       one other master is currently
> + *                       using the node
> + *
> + * Return:     Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_node_status(const u32 node,
> +			u32 *status, u32 *requirements,
> +			u32 *usage)
> +
> +{
> +   u32 ret_payload[PAYLOAD_ARG_CNT];
> +   int ret;
> +
> +   if (!status)
> +       return -EINVAL;
> +
> +   ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, node, 0, 0,
> +                 0, ret_payload);
> +   if (ret_payload[0] == XST_PM_SUCCESS) {
> +       *status = ret_payload[1];
> +       if (requirements)
> +           *requirements = ret_payload[2];
> +       if (usage)
> +           *usage = ret_payload[3];
> +   }
> +
> +   return ret;

indentation.

M

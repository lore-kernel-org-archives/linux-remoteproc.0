Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH v3 2/5] firmware: xilinx: Add shutdown/wakeup APIs
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
 <1587421629-914-3-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <f1638adf-1c5b-22bd-e2cc-8264435b99fd@xilinx.com>
Date: Tue, 21 Apr 2020 07:57:44 +0200
MIME-Version: 1.0
In-Reply-To: <1587421629-914-3-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 21. 04. 20 0:27, Ben Levinsky wrote:
> Add shutdown/wakeup a resource eemi operations to shutdown
> or bringup a resource.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> changes since v2:
> - add xilinx-related platform mgmt fn's instead of wrapping around
> 	function pointer in xilinx eemi ops struct
> 
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h | 20 ++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index bfaf29a..b0d140f 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -845,6 +845,41 @@ int zynqmp_pm_release_node(const u32 node)
>  EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
>  
>  /**
> + * zynqmp_pm_force_powerdown - PM call to request for another PU or subsystem to
> + *             be powered down forcefully
> + * @target:    Node ID of the targeted PU or subsystem
> + * @ack:   Flag to specify whether acknowledge is requested
> + *
> + * Return: Returns status, either success or error+reason

This looks weird - two "Return" words doesn't look right.

> + */
> +int zynqmp_pm_force_powerdown(const u32 target,
> +                  const enum zynqmp_pm_request_ack ack)

This should be aligned - run checkpatch --strict. And fix it globally.

> +{
> +   return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, target, ack, 0, 0, NULL);

Also no spaces at the start of line is reported here.


Thanks,
Michal

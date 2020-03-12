Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for
 RPU configuration.
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-2-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <4d95f021-c3cc-3238-665d-8d5825c6a123@xilinx.com>
Date: Thu, 12 Mar 2020 08:32:01 +0100
MIME-Version: 1.0
In-Reply-To: <1582566751-13118-2-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 24. 02. 20 18:52, Ben Levinsky wrote:
> Add ZynqMP firmware ioctl enums for RPU configuration.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     |  4 ++++
>  include/linux/firmware/xlnx-zynqmp.h | 19 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index ecc339d..20e4574 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -512,6 +512,10 @@ static int zynqmp_pm_clock_getparent(u32 clock_id, u32 *parent_id)
>  static inline int zynqmp_is_valid_ioctl(u32 ioctl_id)
>  {
>  	switch (ioctl_id) {
> +	case IOCTL_GET_RPU_OPER_MODE:
> +	case IOCTL_SET_RPU_OPER_MODE:
> +	case IOCTL_RPU_BOOT_ADDR_CONFIG:
> +	case IOCTL_TCM_COMB_CONFIG:
>  	case IOCTL_SET_PLL_FRAC_MODE:
>  	case IOCTL_GET_PLL_FRAC_MODE:
>  	case IOCTL_SET_PLL_FRAC_DATA:
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 2cd12eb..b8ca118 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -100,6 +100,10 @@ enum pm_ret_status {
>  };
>  
>  enum pm_ioctl_id {
> +	IOCTL_GET_RPU_OPER_MODE = 0,
> +	IOCTL_SET_RPU_OPER_MODE,
> +	IOCTL_RPU_BOOT_ADDR_CONFIG,
> +	IOCTL_TCM_COMB_CONFIG,
>  	IOCTL_SET_SD_TAPDELAY = 7,
>  	IOCTL_SET_PLL_FRAC_MODE,
>  	IOCTL_GET_PLL_FRAC_MODE,
> @@ -118,6 +122,21 @@ enum pm_query_id {
>  	PM_QID_CLOCK_GET_MAX_DIVISOR,
>  };
>  
> +enum rpu_oper_mode {
> +	PM_RPU_MODE_LOCKSTEP,
> +	PM_RPU_MODE_SPLIT,
> +};
> +
> +enum rpu_boot_mem {
> +	PM_RPU_BOOTMEM_LOVEC,
> +	PM_RPU_BOOTMEM_HIVEC,
> +};
> +
> +enum rpu_tcm_comb {
> +	PM_RPU_TCM_SPLIT,
> +	PM_RPU_TCM_COMB,
> +};
> +
>  enum zynqmp_pm_reset_action {
>  	PM_RESET_ACTION_RELEASE,
>  	PM_RESET_ACTION_ASSERT,
> 

This is fine.

M

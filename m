Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 20 Jan 2017 10:38:26 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC PATCH v2 1/3] remoteproc: qcom: make adsp resource handling
 generic.
Message-ID: <20170120183826.GA10531@minitux>
References: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
 <1484928636-27351-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484928636-27351-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 20 Jan 08:10 PST 2017, Avaneesh Kumar Dwivedi wrote:

> This patch make resource handling generic in adsp remoteproc driver.
> Resources which were initialized with hard definition are being
> initialized now based on compatible string. Generic way of resource
> initialization and handling is required so that slpi processor boot
> support can also be enabled with same driver.
> 

I think adding a "generic way of resource initialization and handling"
is overkill for this driver, at this point in time at least.

> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_adsp_pil.c | 259 +++++++++++++++++++++++++++++--------
>  1 file changed, 208 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
> index 43a4ed2..ab2632b 100644
> --- a/drivers/remoteproc/qcom_adsp_pil.c
> +++ b/drivers/remoteproc/qcom_adsp_pil.c
> @@ -32,9 +32,26 @@
>  #include "qcom_mdt_loader.h"
>  #include "remoteproc_internal.h"
>  
> -#define ADSP_CRASH_REASON_SMEM		423
> -#define ADSP_FIRMWARE_NAME		"adsp.mdt"
> -#define ADSP_PAS_ID			1
> +struct reg_info {
> +	struct regulator *reg;
> +	int uV;
> +	int uA;
> +};
> +
> +struct regulator_res {
> +	const char *supply;
> +	int uV;
> +	int uA;
> +};

As far as I can see we have 2 variables:

1) Do we have px-supply?

We could just always devm_regualator_get("px"), in the adsp case this
would give us a dummy regulator that we can still
regulator_enable/disable. So we can keep the code unconditional.

If we want to save the reader of the kernel log a printout about a dummy
voltage we can carry a "bool has_px" in the adsp_data.

The mechanism for controlling corner voltages will be something other
than the regulator api, so let's not design the driver for
voltage/current selection yet.

2) Do we have aggre2_noc clock?

This info we can carry with a bool in the data struct, making the
devm_clk_get("aggre2") depend on this or leave the clk NULL - also
calling this unconditionally.

> +
> +struct generic_rproc_res {

Please name this "adsp_data".

> +	int crash_reason_smem;
> +	const char *firmware_name;
> +	int fw_pas_id;

"pas_id" is enough.

> +	struct regulator_res reg_res[3];
> +	char **clocks_name;
> +};
> +
>  
>  struct qcom_adsp {
>  	struct device *dev;
> @@ -49,9 +66,13 @@ struct qcom_adsp {
>  	struct qcom_smem_state *state;
>  	unsigned stop_bit;
>  
> -	struct clk *xo;
> +	struct clk *clocks[3];
> +	int clk_count;
> +	struct reg_info regulators[3];
> +	int reg_count;
>  
> -	struct regulator *cx_supply;
> +	int fw_pas_id;

"pas_id"

> +	int crash_reason_smem;
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> @@ -62,6 +83,136 @@ struct qcom_adsp {
>  	size_t mem_size;
>  };
>  
[..]
>  
> -static int adsp_init_clock(struct qcom_adsp *adsp)
> -{
> -	int ret;
> -
> -	adsp->xo = devm_clk_get(adsp->dev, "xo");
> -	if (IS_ERR(adsp->xo)) {
> -		ret = PTR_ERR(adsp->xo);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(adsp->dev, "failed to get xo clock");
> -		return ret;
> -	}
> -

Just do:
	if (adsp->has_aggre2_clk) {
		adsp->aggre2_clk = devm_clk_get(..);
		...
	}

> -	return 0;
> -}
> -
> -static int adsp_init_regulator(struct qcom_adsp *adsp)
> -{
> -	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
> -	if (IS_ERR(adsp->cx_supply))
> -		return PTR_ERR(adsp->cx_supply);
> -
> -	regulator_set_load(adsp->cx_supply, 100000);

If you just request "px" unconditionally here we will get a print in the
log informing us that we got a dummy regulator. If we want to be fancy
and not have that you can do a boolean.

> -
> -	return 0;
> -}
> -
[..]
>  
> +static const struct generic_rproc_res adsp_resource_init = {
> +		.crash_reason_smem = 423,
> +		.firmware_name = "adsp.mdt",
> +		.fw_pas_id = 1,
> +		.reg_res = (struct regulator_res[]) {
> +			{
> +				.supply = "vdd_cx",
> +			},
> +			{},
> +			{}
> +		},
> +		.clocks_name = (char*[]){
> +			"xo",
> +			NULL
> +		},
> +};

Please leave this a empty line between these.

>  static const struct of_device_id adsp_of_match[] = {
> -	{ .compatible = "qcom,msm8974-adsp-pil" },
> -	{ .compatible = "qcom,msm8996-adsp-pil" },
> +	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, adsp_of_match);

Regards,
Bjorn

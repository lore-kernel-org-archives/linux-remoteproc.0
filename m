Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 6 Aug 2018 09:48:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: q6v5: Add support to vote for rpmh power
 domains
Message-ID: <20180806164848.GA21235@tuxbook-pro>
References: <20180629102035.2757-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180629102035.2757-1-rnayak@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: viresh.kumar@linaro.org, sibis@codeaurora.org, ulf.hansson@linaro.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 29 Jun 03:20 PDT 2018, Rajendra Nayak wrote:

> With rpmh ARC resources being modelled as power domains with
> performance state, add support to proxy vote on these for SDM845.
> Add support to vote on multiple of them, now that genpd supports
> associating multiple power domains to a device.
> 

Thanks for writing up this patch Rajendra.

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> This patch is dependent on the rpmh powerdomain driver
> still under review,
> https://lkml.org/lkml/2018/6/27/7
> 
>  drivers/remoteproc/qcom_q6v5_pil.c | 77 +++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 2bf8e7c49f2a..2b5be6d15779 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -25,6 +25,8 @@
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc.h>
> @@ -132,6 +134,7 @@ struct rproc_hexagon_res {
>  	char **proxy_clk_names;
>  	char **reset_clk_names;
>  	char **active_clk_names;
> +	char **pd_names;
>  	int version;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> @@ -161,9 +164,11 @@ struct q6v5 {
>  	struct clk *active_clks[8];
>  	struct clk *reset_clks[4];
>  	struct clk *proxy_clks[4];
> +	struct device *pd_devs[3];
>  	int active_clk_count;
>  	int reset_clk_count;
>  	int proxy_clk_count;
> +	int pd_count;
>  
>  	struct reg_info active_regs[1];
>  	struct reg_info proxy_regs[3];
> @@ -324,6 +329,23 @@ static void q6v5_clk_disable(struct device *dev,
>  		clk_disable_unprepare(clks[i]);
>  }
>  
> +static int q6v5_powerdomain_enable(struct device *dev, struct device **devs,
> +				   int count)
> +{
> +	int i;
> +
> +	if (!count)
> +		return 0;
> +
> +	if (count > 1)
> +		for (i = 0; i < count; i++)
> +			dev_pm_genpd_set_performance_state(devs[i], INT_MAX);
> +	else
> +		dev_pm_genpd_set_performance_state(dev, INT_MAX);

I would prefer if we could just set the performance state during
initialization, but I see that we only aggregate the state during
dev_pm_genpd_set_performance_state().

As such you need to also reduce the votes in the disable path; or we
will just max out any shared corners from the first time we boot this
remoteproc.


For this to work I believe _genpd_power_o{n,ff}() would need to
aggregate the performance state of all enabled consumers, something that
would make the interface more convenient to use.

> +
> +	return pm_runtime_get_sync(dev);
> +}
> +
[..]
> @@ -1142,6 +1173,35 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
>  	return i;
>  }
>  
> +static int q6v5_powerdomain_init(struct device *dev, struct device **devs,
> +				 char **pd_names)
> +{
> +	int i = 0, num_pds;
> +
> +	if (!pd_names)
> +		return 0;
> +
> +	while (pd_names[i])
> +		i++;
> +
> +	num_pds = i;
> +
> +	if (num_pds > 1) {
> +		for (i = 0; i < num_pds; i++) {
> +			devs[i] = genpd_dev_pm_attach_by_id(dev, i);

This should be done by_name

> +			if (IS_ERR(devs[i]))
> +				return PTR_ERR(devs[i]);
> +			if (!device_link_add(dev, devs[i], DL_FLAG_STATELESS |
> +					     DL_FLAG_PM_RUNTIME))
> +				return -EINVAL;
> +		}
> +	}
> +
> +	pm_runtime_enable(dev);

Don't you need a call to something like pm_suspend_ignore_children()
here as well, to prevent a pm_runtime_get_sync() in a child device to
power on our rails at runtime?

> +
> +	return num_pds;
> +};
> +
>  static int q6v5_init_reset(struct q6v5 *qproc)
>  {
>  	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,

Regards,
Bjorn

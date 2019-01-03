Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 3 Jan 2019 15:09:28 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: Add support for parsing fw dt
 bindings
Message-ID: <20190103230928.GF31596@builder>
References: <20181228044819.5697-1-sibis@codeaurora.org>
 <20181228044819.5697-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181228044819.5697-3-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 27 Dec 20:48 PST 2018, Sibi Sankar wrote:

> Add support for parsing "firmware-name" dt bindings which specifies
> the relative paths of mba/modem/pas image as strings. Fallback to
> the default paths for mba/modem/pas image on -EINVAL.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Thanks Sibi, just some minor style issues I would prefer to have fixed.

I picked patch 1, so no need to resend that.

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 46 +++++++++++++++++++++++-------
>  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-
>  2 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 01be7314e176..c75179006e24 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -188,6 +188,7 @@ struct q6v5 {
>  	bool has_alt_reset;
>  	int mpss_perm;
>  	int mba_perm;
> +	const char *hexagon_mdt_image;
>  	int version;
>  };
>  
> @@ -860,17 +861,27 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	phys_addr_t min_addr = PHYS_ADDR_MAX;
>  	phys_addr_t max_addr = 0;
>  	bool relocate = false;
> -	char seg_name[10];
> +	char *fw_name;
> +	size_t fw_name_len;
>  	ssize_t offset;
>  	size_t size = 0;
>  	void *ptr;
>  	int ret;
>  	int i;
>  
> -	ret = request_firmware(&fw, "modem.mdt", qproc->dev);
> +	fw_name_len = strlen(qproc->hexagon_mdt_image);
> +	if (fw_name_len <= 4)
> +		return -EINVAL;
> +
> +	fw_name = kstrdup(qproc->hexagon_mdt_image, GFP_KERNEL);
> +	if (!fw_name)
> +		return -ENOMEM;
> +
> +	ret = request_firmware(&fw, qproc->hexagon_mdt_image, qproc->dev);

Use fw_name here.

>  	if (ret < 0) {
> -		dev_err(qproc->dev, "unable to load modem.mdt\n");
> -		return ret;
> +		dev_err(qproc->dev, "unable to load %s\n",
> +			qproc->hexagon_mdt_image);
> +		goto out;
>  	}
>  
>  	/* Initialize the RMB validator */
> @@ -918,10 +929,12 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  		ptr = qproc->mpss_region + offset;
>  
>  		if (phdr->p_filesz) {
> -			snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
> -			ret = request_firmware(&seg_fw, seg_name, qproc->dev);
> +			snprintf(fw_name + fw_name_len - 3, fw_name_len,
> +				 "b%02d", i);
> +			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
>  			if (ret) {
> -				dev_err(qproc->dev, "failed to load %s\n", seg_name);
> +				dev_err(qproc->dev, "failed to load %s\n",
> +					fw_name);

Follow my lead and break the 80-char limit.

>  				goto release_firmware;
>  			}
>  
> @@ -960,6 +973,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  
>  release_firmware:
>  	release_firmware(fw);
> +out:
> +	kfree(fw_name);
>  
>  	return ret < 0 ? ret : 0;
>  }
> @@ -1075,9 +1090,10 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  	unsigned long i;
>  	int ret;
>  
> -	ret = request_firmware(&fw, "modem.mdt", qproc->dev);
> +	ret = request_firmware(&fw, qproc->hexagon_mdt_image, qproc->dev);
>  	if (ret < 0) {
> -		dev_err(qproc->dev, "unable to load modem.mdt\n");
> +		dev_err(qproc->dev, "unable to load %s\n",
> +			qproc->hexagon_mdt_image);
>  		return ret;
>  	}
>  
> @@ -1253,6 +1269,8 @@ static int q6v5_probe(struct platform_device *pdev)
>  	const struct rproc_hexagon_res *desc;
>  	struct q6v5 *qproc;
>  	struct rproc *rproc;
> +	const char *mba_image;
> +	const char *fw_name[2];
>  	int ret;
>  
>  	desc = of_device_get_match_data(&pdev->dev);
> @@ -1262,8 +1280,15 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (desc->need_mem_protection && !qcom_scm_is_available())
>  		return -EPROBE_DEFER;
>  
> +	ret = of_property_read_string_array(pdev->dev.of_node, "firmware-name",
> +					    fw_name, 2);
> +	if (ret != -EINVAL && ret != 2)
> +		return ret > 0 ? -EINVAL : ret;
> +
> +	mba_image = (ret != 2) ? desc->hexagon_mba_image : fw_name[0];

Use the fact that of_property_read_string_index() leaves the output
parameter untouched if it doesn't succeed in parsing the property.

I.e. do:

mba_image = desc->hexagon_mba_image;
ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
				    0, &mba_image);
if (ret < 0 && ret != -EINVAL)
	fail();

and

qproc->hexagon_mdt_image = "modem.mdt";
ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
				    1, &qproc->hexagon_mdt_image);
if (ret < 0 && ret != -EINVAL)
	fail();

> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
> -			    desc->hexagon_mba_image, sizeof(*qproc));
> +			    mba_image, sizeof(*qproc));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "failed to allocate rproc\n");
>  		return -ENOMEM;
> @@ -1272,6 +1297,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc = (struct q6v5 *)rproc->priv;
>  	qproc->dev = &pdev->dev;
>  	qproc->rproc = rproc;
> +	qproc->hexagon_mdt_image = (ret != 2) ? "modem.mdt" : fw_name[1];
>  	platform_set_drvdata(pdev, qproc);
>  
>  	ret = q6v5_init_mem(qproc, pdev);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b1e63fcd5fdf..141c7da29e9a 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -258,6 +258,8 @@ static int adsp_probe(struct platform_device *pdev)
>  	const struct adsp_data *desc;
>  	struct qcom_adsp *adsp;
>  	struct rproc *rproc;
> +	const char *fw_name;
> +	const char *of_fw_name;
>  	int ret;
>  
>  	desc = of_device_get_match_data(&pdev->dev);
> @@ -267,8 +269,15 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (!qcom_scm_is_available())
>  		return -EPROBE_DEFER;
>  
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &of_fw_name);
> +	if (ret && ret != -EINVAL)
> +		return ret;
> +
> +	fw_name = ret ? desc->firmware_name : of_fw_name;

As above, please use the fact that the last parameter of
of_property_read_string() doesn't modify the output if it fails.

> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
> -			    desc->firmware_name, sizeof(*adsp));
> +			    fw_name, sizeof(*adsp));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;

Regards,
Bjorn

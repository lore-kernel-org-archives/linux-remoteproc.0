Date: Thu, 27 Feb 2020 21:34:24 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20200228053420.GC210720@yoga>
References: <20200226170001.24234-1-sibis@codeaurora.org>
 <20200226170001.24234-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226170001.24234-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, vnkgutta@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 26 Feb 08:59 PST 2020, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
[..]
> +config QCOM_PDR_HELPERS
> +	tristate
> +	depends on ARCH_QCOM || COMPILE_TEST

As discussed on one of you other patches, please omit the depends on for
Kconfig entries that are not user selectable. Presumably anyone
selecting this option will have ARCH_QCOM met already.

> +	select QCOM_QMI_HELPERS
[..]
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
[..]
> +static void pdr_locator_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      locator_work);
> +	struct pdr_service *pds;
> +	int ret = 0;
> +
> +	/* Bail out early if the SERVREG LOCATOR QMI service is not up */
> +	mutex_lock(&pdr->lock);
> +	if (!pdr->locator_init_complete) {
> +		mutex_unlock(&pdr->lock);
> +		pr_debug("PDR: SERVICE LOCATOR service not available\n");
> +		return;
> +	}
> +	mutex_unlock(&pdr->lock);
> +
> +	mutex_lock(&pdr->list_lock);
> +	list_for_each_entry(pds, &pdr->lookups, node) {
> +		if (!pds->need_locator_lookup)
> +			continue;
> +
> +		pds->need_locator_lookup = false;
> +		mutex_unlock(&pdr->list_lock);
> +
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0)
> +			goto exit;
> +
> +		/* Initialize notifier QMI handle */
> +		mutex_lock(&pdr->lock);
> +		if (!pdr->notifier_init_complete) {
> +			ret = qmi_handle_init(&pdr->notifier_hdl,
> +					      SERVREG_STATE_UPDATED_IND_MAX_LEN,
> +					      &pdr_notifier_ops,
> +					      qmi_indication_handler);
> +			if (ret < 0) {
> +				mutex_unlock(&pdr->lock);
> +				goto exit;
> +			}
> +			pdr->notifier_init_complete = true;
> +		}
> +		mutex_unlock(&pdr->lock);
> +
> +		ret = qmi_add_lookup(&pdr->notifier_hdl, pds->service, 1,
> +				     pds->instance);
> +		if (ret < 0)
> +			goto exit;
> +
> +		return;

If the caller calls pdr_add_lookup() multiple times in quick succession
wouldn't it be possile to get the worker scheduled with multiple entries
in &pdr->lookups with need_locator_lookup set?

If so I think it makes sense to break the content of this loop, and the
error handling under exit out into a separate function.

And even if this would not be the case, breaking this out in a separate
function would allow you to change the loop to:

	list_for_each_entry() {
		if (pdr->need_locator_lookup) {
			do_the_lookup();
			break;
		}
	}

Which I think is easier to reason about than the loop with a return at
the end.

> +	}
> +	mutex_unlock(&pdr->list_lock);
> +exit:
> +	if (ret < 0) {
> +		/* Notify lookup failed */
> +		mutex_lock(&pdr->list_lock);
> +		list_del(&pds->node);
> +		mutex_unlock(&pdr->list_lock);
> +
> +		if (ret == -ENXIO)
> +			pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
> +		else
> +			pds->state = SERVREG_LOCATOR_ERR;
> +
> +		pr_err("PDR: service lookup for %s failed: %d\n",
> +		       pds->service_name, ret);
> +
> +		mutex_lock(&pdr->status_lock);
> +		pdr->status(pds->state, pds->service_path, pdr->priv);
> +		mutex_unlock(&pdr->status_lock);
> +		kfree(pds);
> +	}
> +}
[..]
> +struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
> +						   char *service_path,
> +						   void *priv), void *priv)
> +{
> +	struct pdr_handle *pdr;
> +	int ret;
> +
> +	if (!status)
> +		return ERR_PTR(-EINVAL);
> +
> +	pdr = kzalloc(sizeof(*pdr), GFP_KERNEL);
> +	if (!pdr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdr->status = *status;

Please omit the * here.

Regards,
Bjorn

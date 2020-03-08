Date: Sun, 8 Mar 2020 14:32:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
Message-ID: <20200308213220.GK1094083@builder>
References: <20200304200911.15415-1-sibis@codeaurora.org>
 <20200304200911.15415-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304200911.15415-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: srinivas.kandagatla@linaro.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, vnkgutta@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 04 Mar 12:09 PST 2020, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
[..]
> +static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
> +{
> +	struct servreg_get_domain_list_resp *resp;
> +	struct servreg_get_domain_list_req req;
> +	struct servreg_location_entry *entry;
> +	int domains_read = 0;
> +	int ret, i;
> +
> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
> +	if (!resp)
> +		return -ENOMEM;
> +
> +	/* Prepare req message */
> +	strcpy(req.service_name, pds->service_name);
> +	req.domain_offset_valid = true;
> +	req.domain_offset = 0;
> +
> +	do {
> +		req.domain_offset = domains_read;
> +		ret = pdr_get_domain_list(&req, resp, pdr);
> +		if (ret < 0)
> +			goto out;
> +
> +		for (i = domains_read; i < resp->domain_list_len; i++) {
> +			entry = &resp->domain_list[i];
> +
> +			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))
> +				continue;
> +
> +			if (!strcmp(entry->name, pds->service_path)) {
> +				pds->service_data_valid = entry->service_data_valid;
> +				pds->service_data = entry->service_data;
> +				pds->instance = entry->instance;
> +				goto out;
> +			}
> +		}
> +
> +		/* Update ret to indicate that the service is not yet found */
> +		ret = -ENXIO;
> +
> +		/* Always read total_domains from the response msg */
> +		if (resp->domain_list_len > resp->total_domains)
> +			resp->domain_list_len = resp->total_domains;
> +
> +		domains_read += resp->domain_list_len;
> +	} while (domains_read < resp->total_domains);
> +out:
> +	kfree(resp);
> +	return ret;
> +}
> +
> +static void pdr_notify_lookup_failure(struct pdr_handle *pdr,
> +				      struct pdr_service *pds,
> +				      int err)
> +{
> +	list_del(&pds->node);
> +
> +	if (err == -ENXIO)
> +		pds->state = SERVREG_LOCATOR_UNKNOWN_SERVICE;
> +	else
> +		pds->state = SERVREG_LOCATOR_ERR;
> +
> +	pr_err("PDR: service lookup for %s failed: %d\n",
> +	       pds->service_name, err);
> +
> +	mutex_lock(&pdr->status_lock);
> +	pdr->status(pds->state, pds->service_path, pdr->priv);
> +	mutex_unlock(&pdr->status_lock);
> +	kfree(pds);

So this implies that we didn't find the service and we will never find
it? How are the client drivers expected to react to above two states?

> +}
> +
> +static void pdr_locator_work(struct work_struct *work)
> +{
> +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
> +					      locator_work);
> +	struct pdr_service *pds, *tmp;
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
> +	list_for_each_entry_safe(pds, tmp, &pdr->lookups, node) {
> +		if (!pds->need_locator_lookup)
> +			continue;
> +
> +		pds->need_locator_lookup = false;
> +		ret = pdr_locate_service(pdr, pds);
> +		if (ret < 0)
> +			pdr_notify_lookup_failure(pdr, pds, ret);

If I read this correctly, pdr_locate_service() returning an error seems
to mean that pd->instance won't be filled out, as such I don't think you
want to proceed.

Further more, pdr_notify_lookup_failure() ends up freeing the pds, so
below lookup would be a use after free, not unlikely followed by a
double free of pds.

How about a "continue" here and only clear need_locator_lookup if both
of these checks pass?

> +
> +		ret = qmi_add_lookup(&pdr->notifier_hdl, pds->service, 1,
> +				     pds->instance);
> +		if (ret < 0)
> +			pdr_notify_lookup_failure(pdr, pds, ret);
> +	}
> +	mutex_unlock(&pdr->list_lock);
> +}

Apart from that I think the patches look good now.

Regards,
Bjorn

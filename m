Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: Introduce sysmon
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-5-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <0ab5497e-94b4-6450-d680-14f002188714@codeaurora.org>
Date: Thu, 16 Nov 2017 12:05:00 -0800
MIME-Version: 1.0
In-Reply-To: <20171115201012.25892-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, runminw@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Question about the SSR events for sysmon.

Thanks,
Chris

On 11/15/2017 12:10 PM, Bjorn Andersson wrote:

[..]
> +/**
> + * ssctl_send_event() - send notification of other remote's SSR event
> + * @sysmon:	sysmon context
> + * @name:	other remote's name
> + */
> +static void ssctl_send_event(struct qcom_sysmon *sysmon, const char *name)
> +{
> +	struct ssctl_subsys_event_resp resp;
> +	struct ssctl_subsys_event_req req;
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	memset(&resp, 0, sizeof(resp));
> +	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_subsys_event_resp_ei, &resp);
> +	if (ret < 0) {
> +		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
> +		return;
> +	}
> +
> +	memset(&req, 0, sizeof(req));
> +	strlcpy(req.subsys_name, name, sizeof(req.subsys_name));
> +	req.subsys_name_len = strlen(req.subsys_name);
> +	req.event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;

Are there plans to add the other SSR events to sysmon notifiers? I think 
the SSCTL service expects to receive events about remote procs starting 
as well.

> +	req.evt_driven_valid = true;
> +	req.evt_driven = SSCTL_SSR_EVENT_FORCED;
> +
> +	ret = qmi_send_request(&sysmon->qmi, &sysmon->ssctl, &txn,
> +			       SSCTL_SUBSYS_EVENT_REQ, 40,
> +			       ssctl_subsys_event_req_ei, &req);
> +	if (ret < 0) {
> +		dev_err(sysmon->dev, "failed to send shutdown request\n");
> +		qmi_txn_cancel(&txn);
> +		return;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, 5 * HZ);
> +	if (ret < 0)
> +		dev_err(sysmon->dev, "failed receiving QMI response\n");
> +	else if (resp.resp.result)
> +		dev_err(sysmon->dev, "ssr event send failed\n");
> +	else
> +		dev_dbg(sysmon->dev, "ssr event send completed\n");
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH v3 2/5] soc: qcom: Introduce QMI helpers
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-3-bjorn.andersson@linaro.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <98a56116-d6f8-9084-d49e-c7669ddaa945@codeaurora.org>
Date: Fri, 17 Nov 2017 18:11:03 -0800
MIME-Version: 1.0
In-Reply-To: <20171115201012.25892-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 11/15/2017 12:10 PM, Bjorn Andersson wrote:
[..]> +static void qmi_handle_message(struct qmi_handle *qmi,
> +			       struct sockaddr_qrtr *sq,
> +			       const void *buf, size_t len)
> +{
> +	const struct qmi_header *hdr;
> +	struct qmi_txn tmp_txn;
> +	struct qmi_txn *txn = NULL;
> +	int ret;
> +
> +	if (len < sizeof(*hdr)) {
> +		pr_err("ignoring short QMI packet\n");
> +		return;
> +	}
> +
> +	hdr = buf;
> +
> +	/* If this is a response, find the matching transaction handle */
> +	if (hdr->type == QMI_RESPONSE) {
> +		mutex_lock(&qmi->txn_lock);
> +		txn = idr_find(&qmi->txns, hdr->txn_id);
> +		if (txn)
> +			mutex_lock(&txn->lock);
> +		mutex_unlock(&qmi->txn_lock);
> +	}
> +
> +	if (txn && txn->dest && txn->ei) {
> +		ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
> +		if (ret < 0)
> +			pr_err("failed to decode incoming message\n");
> +
> +		txn->result = ret;
> +		complete(&txn->completion);
> +
> +		mutex_unlock(&txn->lock);
> +	} else if (txn) {
> +		qmi_invoke_handler(qmi, sq, txn, buf, len);
> +
> +		mutex_unlock(&txn->lock);
> +	} else {
> +		/* Create a txn based on the txn_id of the incoming message */
> +		memset(&tmp_txn, 0, sizeof(tmp_txn));
> +		tmp_txn.id = hdr->txn_id;
> +
> +		qmi_invoke_handler(qmi, sq, &tmp_txn, buf, len);

I'm seeing an opportunity for user error with timed out transactions. If 
txn_wait gets timed out the txn is removed from the txns list. Later if 
we get the response, it comes down to this else with the tmp_txn. Some 
handlers may try to do a complete(&txn->completion) like the 
qmi_sample_client ping_pong_cb. This leads to a null pointer dereference 
since the temp txn was never initialized.

Should clients not call complete and we can call the complete in the 
else if(txn) condition?

Thanks,
Chris
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

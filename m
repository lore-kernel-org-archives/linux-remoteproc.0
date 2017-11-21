Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 21 Nov 2017 14:42:07 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/5] soc: qcom: Introduce QMI helpers
Message-ID: <20171121224207.GE28761@minitux>
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-3-bjorn.andersson@linaro.org>
 <98a56116-d6f8-9084-d49e-c7669ddaa945@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98a56116-d6f8-9084-d49e-c7669ddaa945@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 17 Nov 18:11 PST 2017, Chris Lew wrote:
> On 11/15/2017 12:10 PM, Bjorn Andersson wrote:
> [..]> +static void qmi_handle_message(struct qmi_handle *qmi,
> > +			       struct sockaddr_qrtr *sq,
> > +			       const void *buf, size_t len)
> > +{
> > +	const struct qmi_header *hdr;
> > +	struct qmi_txn tmp_txn;
> > +	struct qmi_txn *txn = NULL;
> > +	int ret;
> > +
> > +	if (len < sizeof(*hdr)) {
> > +		pr_err("ignoring short QMI packet\n");
> > +		return;
> > +	}
> > +
> > +	hdr = buf;
> > +
> > +	/* If this is a response, find the matching transaction handle */
> > +	if (hdr->type == QMI_RESPONSE) {
> > +		mutex_lock(&qmi->txn_lock);
> > +		txn = idr_find(&qmi->txns, hdr->txn_id);
> > +		if (txn)
> > +			mutex_lock(&txn->lock);
> > +		mutex_unlock(&qmi->txn_lock);
> > +	}
> > +
> > +	if (txn && txn->dest && txn->ei) {
> > +		ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
> > +		if (ret < 0)
> > +			pr_err("failed to decode incoming message\n");
> > +
> > +		txn->result = ret;
> > +		complete(&txn->completion);
> > +
> > +		mutex_unlock(&txn->lock);
> > +	} else if (txn) {
> > +		qmi_invoke_handler(qmi, sq, txn, buf, len);
> > +
> > +		mutex_unlock(&txn->lock);
> > +	} else {
> > +		/* Create a txn based on the txn_id of the incoming message */
> > +		memset(&tmp_txn, 0, sizeof(tmp_txn));
> > +		tmp_txn.id = hdr->txn_id;
> > +
> > +		qmi_invoke_handler(qmi, sq, &tmp_txn, buf, len);
> 
> I'm seeing an opportunity for user error with timed out transactions. If
> txn_wait gets timed out the txn is removed from the txns list. Later if we
> get the response, it comes down to this else with the tmp_txn. Some handlers
> may try to do a complete(&txn->completion) like the qmi_sample_client
> ping_pong_cb. This leads to a null pointer dereference since the temp txn
> was never initialized.
> 

You're right, that's no good.

> Should clients not call complete and we can call the complete in the else
> if(txn) condition?
> 

I don't think the problem is limited to the completion. A typical design
pattern for these things could be to wrap the txn in a struct and use
container_of() in the response handler to access or fill in additional
information. If the txn in this scenario happens to be the temporal one
we've just messed up the stack.

The else statement was added to deal with requests and indications. The
case I can think of where this would make sense is for a client to send
a request but not wait for the result and then have some logic to happen
once the response arrives (but unrelated to the requesting context).

The quick solution would be to not allow this to happen, i.e. only take
the else block if it's a request or a indication. The alternative is to
allow the response-handler to know if it was called from the
else-statement, but that would mean that every response-handler would
have to check this.

Regards,
Bjorn

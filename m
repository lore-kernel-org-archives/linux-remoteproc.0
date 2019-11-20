Return-Path: <0101016e88bac931-1ce970b3-94b4-4cc5-9719-4a0820a18c14-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Nov 2019 12:12:53 +0000
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 1/3] soc: qcom: Introduce Protection Domain Restart
 helpers
In-Reply-To: <20191119231740.GJ18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9be5e-1d6bbe06-4bab-434d-9040-ebfa3918b213-000000@us-west-2.amazonses.com>
 <20191119064026.GE18024@yoga>
 <0101016e832bd54d-453473ee-c0fa-44f5-a873-55b97dff4a9a-000000@us-west-2.amazonses.com>
 <20191119231740.GJ18024@yoga>
Message-ID: <0101016e88bac931-1ce970b3-94b4-4cc5-9719-4a0820a18c14-000000@us-west-2.amazonses.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-11-20 04:47, Bjorn Andersson wrote:
> On Tue 19 Nov 02:18 PST 2019, sibis@codeaurora.org wrote:
> 
>> Hey Bjorn,
>> Thanks for taking the time to
>> review the series :)
>> 
>> On 2019-11-19 12:10, Bjorn Andersson wrote:
>> > On Mon 18 Nov 06:27 PST 2019, Sibi Sankar wrote:
>> > > diff --git a/drivers/soc/qcom/pdr_interface.c
>> > > b/drivers/soc/qcom/pdr_interface.c
>> > [..]
>> > > +static void pdr_indack_work(struct work_struct *work)
>> > > +{
>> > > +	struct pdr_handle *pdr = container_of(work, struct pdr_handle,
>> > > +					      indack_work);
>> > > +	struct pdr_list_node *ind, *tmp;
>> > > +	struct pdr_service *pds;
>> > > +
>> > > +	list_for_each_entry_safe(ind, tmp, &pdr->indack_list, node) {
>> > > +		pds = ind->pds;
>> > > +		pdr_send_indack_msg(pdr, pds, ind->transaction_id);
>> >
>> > So when we et a ind_cb with the new status, we need to send an ack
>> > request, which will result in a response, just to confirm that we got
>> > the event?
>> >
>> > Seems like we should fix the qmi code to make it possible to send a
>> > request from the indication handler and then we could simply ignore the
>> 
>> yeah maybe having a provision to send custom requests back on
>> indication would be the way to go. Not all indication need to be
>> services with requests.
>> 
> 
> Let's put this on the todo list.
> 
>> > response. Or do we need to not pdr->status() until we get the response
>> > for some reason?
>> 
>> adsp waits on the ack response for a fixed duration and seems to throw
>> a fatal err is the ack is not serviced. Hence holding back pd->status
>> till we service the ack here.
>> 
> 
> You mean to ensure that someone sleeping in pd->status() doesn't delay
> that until its too late?

yes

> 
> [..]
>> > > +int pdr_handle_init(struct pdr_handle *pdr,
>> > > +		    int (*status)(struct pdr_handle *pdr,
>> > > +				  struct pdr_service *pds))
>> > > +{
>> > [..]
>> > > +	pdr->servreg_wq = create_singlethread_workqueue("pdr_servreg_wq");
>> > > +	if (!pdr->servreg_wq)
>> > > +		return -ENOMEM;
>> > > +
>> > > +	pdr->indack_wq = alloc_ordered_workqueue("pdr_indack_wq",
>> > > WQ_HIGHPRI);
>> >
>> > The two workqueues means that we should be able to call pdr->status()
>> > rom two concurrent contexts, I don't think our clients will expect that.
>> >
>> 
>> would creating another ordered wq to relay all the pd->status make
>> sense?
>> 
> 
> I would prefer less work queues ;) But I presume you split out the
> indack_wq in order to improve the likelihood of meeting the latency
> requirements of the remote side.
> 
> Perhaps just wrap the status() calls with a status-mutex and then 
> remove
> that by reworking the QMI interface to allow us to remove the indack
> work?

okay will fix it in the next
re-spin.

> 
> Regards,
> Bjorn

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

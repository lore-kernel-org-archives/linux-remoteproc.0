Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Access APCS through mailbox framework
References: <20171116070842.6362-1-bjorn.andersson@linaro.org>
 <cad92480-7f12-b9f3-a3d1-0a4208849d35@codeaurora.org>
 <20171206190232.GR28761@minitux>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <21b097d0-91ed-5cdc-83b0-4594dffaab6a@codeaurora.org>
Date: Wed, 6 Dec 2017 11:54:27 -0800
MIME-Version: 1.0
In-Reply-To: <20171206190232.GR28761@minitux>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Jitendra Sharma <shajit@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/06/2017 11:02 AM, Bjorn Andersson wrote:
> On Wed 06 Dec 04:08 PST 2017, Jitendra Sharma wrote:
>
>> Hi Bjorn,
>>
> Hi Jitendra,
>
>> On 11/16/2017 12:38 PM, Bjorn Andersson wrote:
> [..]
>>> @@ -365,7 +371,12 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
>>>   {
>>>   	struct qcom_smd_edge *edge = channel->edge;
>>> -	regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
>>> +	if (edge->mbox_chan) {
>>> +		mbox_send_message(edge->mbox_chan, NULL);
>> mbox_send_message could fail. So return value should be checked
> qcom_apcs_ipc_send_data() can't fail, so the case when
> mbox_send_message() would fail is if more than MBOX_TX_QUEUE_LEN (20)
> callers that has managed to put their data in the queue but not yet
> execute msg_submit().
>
> As each bit in the APCS IPC register is modelled as it's own mailbox
> channel this error case would mean that as mbox_send_message() returns
> with an error there will soon be 20 callers entering
> qcom_apcs_ipc_send_data() and trigger this very bit.
>
>
> When this happens mbox_send_message() will print an error in the log, so
> there's no point in having the caller also print an error.
>
> When it comes to dealing with a failing call to mbox_send_message() we
> have already posted the message in the FIFO, so we have no way to abort
> the transmission, as such the only way to deal with this is to either
> retry or ignore the problem; and the mailbox queue will ensure that we
> retry 20 times.
>

Maybe you should wrap this up into a comment in the code? Then we don't
have to dig this out of the mail list archives to figure out why we
aren't checking for an error.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH 13/18] rpmsg: glink: Add rx done command
References: <1502903951-5403-1-git-send-email-sricharan@codeaurora.org>
 <1502903951-5403-14-git-send-email-sricharan@codeaurora.org>
 <a5f890fe-7405-ff03-9a43-0e4d62683cb6@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <67a2b4db-fabb-9787-6813-7bd001814bfc@codeaurora.org>
Date: Tue, 22 Aug 2017 19:46:00 +0530
MIME-Version: 1.0
In-Reply-To: <a5f890fe-7405-ff03-9a43-0e4d62683cb6@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Arun Kumar Neelakantam <aneela@codeaurora.org>, ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,
>> +    /* Take it off the tree of receive intents */
>> +    if (!intent->reuse) {
>> +        spin_lock(&channel->intent_lock);
>> +        idr_remove(&channel->liids, intent->id);
>> +        spin_unlock(&channel->intent_lock);
>> +    }
>> +
>> +    /* Schedule the sending of a rx_done indication */
>> +    spin_lock(&channel->intent_lock);
>> +    list_add_tail(&intent->node, &channel->done_intents);
>> +    spin_unlock(&channel->intent_lock);
>> +
>> +    schedule_work(&channel->intent_work);
> 
> Adding one more parallel path will hit performance, if this worker could not get CPU cycles
> or blocked by other RT or HIGH_PRIO worker on global worker pool.
 The idea is, by design to have parallel non-blocking paths for rx and tx (that is done as a
 part of rx by sending the rx_done command), otherwise trying to send the rx_done
 command in the rx isr context is a problem since the tx can wait for the FIFO space and
 in worst case, can even lead to a potential deadlock if both the local and remote try
 the same. Having said that, instead of queuing this work in to the global queue, this
 can be put in to a local glink edge owned queue (or) a threaded isr ?, downstream does the
 rx_done in a client specific worker.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus

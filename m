Return-Path: <shajit@codeaurora.org>
Subject: Re: [PATCH] remoteproc: Remove null character write of shared mem
References: <1518009762-26480-1-git-send-email-shajit@codeaurora.org>
 <20180207152753.GO9465@builder>
From: Jitendra Sharma <shajit@codeaurora.org>
Message-ID: <d097d5db-b68c-6a29-2032-bb62e8d08d09@codeaurora.org>
Date: Thu, 8 Feb 2018 14:42:37 +0530
MIME-Version: 1.0
In-Reply-To: <20180207152753.GO9465@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,


On 2/7/2018 8:57 PM, Bjorn Andersson wrote:
> On Wed 07 Feb 05:22 PST 2018, Jitendra Sharma wrote:
>
>> remoteproc is writing '\0' in the shared mem region. This
>> region is shared among multiple clients that are also trying
>> to read. Hence they miss first character.
>>
>> Remove this null character write, as this mem area is
>> supposed to be Read only.
>>
>> Further during every subsystem reboot, this region is
>> initialized with default, hence no need to write this
>> region.
> Thanks for your patch Jitendra!
>
> The write was removed from the downstream kernel in msm-4.9, late last
> year. Can you please confirm that you describe here is valid for
> platforms supported prior to this change as well?
>
> E.g. is what you're describing true for wcnss on 8064, adsp on 8974 and
> mpss on 8916?
To provide a history.
We got a internal request, where during subsystem crash/restart, in our 
recovery path, we try to get the cause of crash by reading shared memory 
region.
But, because in recovery path we write null to first character of shared 
memory string. So, any other client which in the meantime try to dump 
the crash region will miss first character of crash region.
For example: actual "err_crash_reason " will be read by other interested 
clients as "rr_crash_reason"

Now as this piece of code is present since long 3.10,3.18,4.4 time, so 
we were not sure of this snippet's reason of existence. Here, initially 
we tried to find out reason for this null write, where we guessed this 
snippet is lying there to ensure, that across subsequent crashes, we 
always get a new updated reason/string(as we are writing null to first 
character of shared mem) and not some older stale string.

But this understanding was rejected by subsystem owners saying that 
crash reason, shared memory item is re-initialized at non-HLOS bootup so 
it will get clear automatically.Hence, there is no need to write null 
character.

So, because of above reason, we could say that this snippet is causing a 
bug and should be fixed and this change should be valid for any platform.
>
> Regards,
> Bjorn

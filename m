Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 19 Jan 2019 09:47:39 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5: don't auto boot remote processor
In-Reply-To: <CA+ASDXPAVfX=EiOKY_t-OoQFuKssbqiK4fAUstOdvO0=69kskg@mail.gmail.com>
References: <20180524192141.20323-1-ramon.fried@gmail.com>
 <20180529042047.GE2259@tuxbook-pro>
 <e554b7e525554d49d193ff1f8ca51359@codeaurora.org>
 <CA+ASDXNMS1n+zBDPi4zbyDYjuEs4n-oFH2QfytvzRpnbK5-_ZQ@mail.gmail.com>
 <31da3e8d35c2b47041536c996efe484c@codeaurora.org>
 <CA+ASDXPAVfX=EiOKY_t-OoQFuKssbqiK4fAUstOdvO0=69kskg@mail.gmail.com>
Message-ID: <04e98c14b5d4113a466879ee9cc3d6d6@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ramon Fried <ramon.fried@gmail.com>, linux-remoteproc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Brian,
Thanks for the review

On 2019-01-19 02:34, Brian Norris wrote:
> Hi Sibi,
> 
> On Fri, Jan 18, 2019 at 11:46 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> On 2019-01-19 00:05, Brian Norris wrote:
>> > On Thu, Jan 17, 2019 at 11:04 PM Sibi Sankar <sibis@codeaurora.org>
>> >> After experimenting with in kernel solutions for
>> >> three revisions and observing problems on graceful
>> >> shutdown usecase,
>> >
>> > What exactly were the problems again? e.g., what were the deficiencies
>> > with having the remoteproc device listen for the REMOTEFS_QMI_SVC_ID
>> > service again? Sorry, but I sort of dropped off on reviewing that
>> > stuff, and now I see this. I'd mildly prefer something that is
>> > actually automatic, but if I'm missing some aspects, I'd like to hear
>> > that. (And, I'd like to see them explained in the commit message, if
>> > this is ever to be merged.)
>> 
>> bringing down the modem after the RMTFS server
>> goes down leaves the modem in limbo (It has a few
>> pending rmtfs transactions that cannot go through)
>> which results in sysmon graceful shutdown failing.
> 
> Makes sense. Probably should be described in a re-send of this patch,
> if we're going with that.
> 
>> And we have to do a modem force-stop to proceed
>> which we want to avoid in graceful shutdown cases.
> 
> Shouldn't you do the "force-stop" in the kernel too? e.g., if rmtfs
> daemon dies without doing a properly-timed stop, then we should still
> force a stop in the kernel, no? Basically, why not do both mechanisms:
> REMOTEFS_QMI_SVC-activated start/stop in the kernel, and manual stop
> (and start? this likely might still be redundant) in the daemon?

yeah we already have that implemented in the kernel
i.e first we try graceful shutdown followed by
force-stop which will just timeout if graceful
shutdown was already completed. We would just call
stop from rmtfs without worrying about the underlying
details.

> 
>> This is overcome by starting rproc mss from rmtfs
>> after REMOTEFS_QMI service is up and stopping
>> rproc mss from rmtfs on SIGKILL/SIGINT and other
>> program error signals before bringing down the
>> RMTFS_QMI service i.e before exiting the rmtfs
>> server loop.
> 
> That's still not really a sure-fire way of doing things. For one, you
> can't catch SIGKILL. Similarly, you can't really clean up from OOM,
> segfault, etc. So it would still be helpful to hook into the QMI
> service notifications in the kernel, I think.

yes we would want a fail safe in the kernel
as well. Sorry I meant SIGTERM instead of
SIGKILL earlier

> 
>> >> switching to controlling the
>> >> remoteproc mss through rmtfs seems to solve all
>> >> the known issues.
>> >
>> > How so? It explicitly does NOT help at all if RMTFS crashes.
>> > Because...who's going to stop the modem in that case? (It works if you
>> > automatically respawn a new RMTFS daemon, to toggle the modem. But
>> > that's kind of cheating, and you can do that anyway, even without this
>> > patch.) On the contrary, your patch *would* resolve that, since the
>> > modem would notice when the RMTFS server goes away, and it would stop
>> > itself.
>> 
>> yeah we would want to mimic what the kernel
>> patch did with the exception of stopping modem
>> before bringing down the rmtfs server (not toggle
>> rproc state but start on rmtfs service up and stop
>> before rmtfs server exit). So in that case we would
>> not want the modem to auto-boot.
> 
> See above. You can't really mimic what the kernel patch was doing
> completely. You can try (which is probably a good idea), but you
> should still have some fallback in the kernel, I expect.

yeah

> 
>> >> https://patchwork.kernel.org/patch/10662395/
>> >>
>> >> we should probably get this merged in, now that
>> >> we are planning to start/stop mss through
>> >> rmtfs.
>> >
>> > Sorry, who's planning to stop mss through rmtfs? Did I miss something?
>> 
>> I have a working patch which I'll soon send
>> upstream for review, after it clears the internal
>> reviews/processes
> 
> OK.
> 
> Brian

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

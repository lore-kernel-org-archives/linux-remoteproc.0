Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 19 Jan 2019 01:16:51 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5: don't auto boot remote processor
In-Reply-To: <CA+ASDXNMS1n+zBDPi4zbyDYjuEs4n-oFH2QfytvzRpnbK5-_ZQ@mail.gmail.com>
References: <20180524192141.20323-1-ramon.fried@gmail.com>
 <20180529042047.GE2259@tuxbook-pro>
 <e554b7e525554d49d193ff1f8ca51359@codeaurora.org>
 <CA+ASDXNMS1n+zBDPi4zbyDYjuEs4n-oFH2QfytvzRpnbK5-_ZQ@mail.gmail.com>
Message-ID: <31da3e8d35c2b47041536c996efe484c@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ramon Fried <ramon.fried@gmail.com>, linux-remoteproc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-01-19 00:05, Brian Norris wrote:
> On Thu, Jan 17, 2019 at 11:04 PM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> On 2018-05-29 09:50, Bjorn Andersson wrote:
>> > On Thu 24 May 12:21 PDT 2018, Ramon Fried wrote:
> 
> Whoa, bringing up a 7-month old patch? Nice.
> 
>> >> Sometimes that rmtfs userspace module is not brought
>> >> up fast enough and the modem crashes.
>> >> disabling automated boot in the driver and triggering
>> >> the boot from user-space sovles the problem.
>> >>
>> >> Signed-off-by: Ramon Fried <ramon.fried@gmail.com>
>> >
>> > Thanks for your patch Ramon. While this nudges the behavior to make
>> > things work slightly better I think we need to describe the explicit
>> > dependency between the mss firmware and the existence of rmtfs.
>> >
>> > As our remoteprocs are essentially always-on I would prefer that they
>> > start "automatically" and not through use of the sysfs interface.
>> >
>> > But we're at the point where this is a real problem on 410, 820 and
>> > 845,
>> > so we have to come up with some way to tie these pieces together. If
>> > your patch suits that solution I will happily take it.
>> >
>> > Regards,
>> > Bjorn
>> 
>> After experimenting with in kernel solutions for
>> three revisions and observing problems on graceful
>> shutdown usecase,
> 
> What exactly were the problems again? e.g., what were the deficiencies
> with having the remoteproc device listen for the REMOTEFS_QMI_SVC_ID
> service again? Sorry, but I sort of dropped off on reviewing that
> stuff, and now I see this. I'd mildly prefer something that is
> actually automatic, but if I'm missing some aspects, I'd like to hear
> that. (And, I'd like to see them explained in the commit message, if
> this is ever to be merged.)

bringing down the modem after the RMTFS server
goes down leaves the modem in limbo (It has a few
pending rmtfs transactions that cannot go through)
which results in sysmon graceful shutdown failing.
And we have to do a modem force-stop to proceed
which we want to avoid in graceful shutdown cases.
This is overcome by starting rproc mss from rmtfs
after REMOTEFS_QMI service is up and stopping
rproc mss from rmtfs on SIGKILL/SIGINT and other
program error signals before bringing down the
RMTFS_QMI service i.e before exiting the rmtfs
server loop.

> 
>> switching to controlling the
>> remoteproc mss through rmtfs seems to solve all
>> the known issues.
> 
> How so? It explicitly does NOT help at all if RMTFS crashes.
> Because...who's going to stop the modem in that case? (It works if you
> automatically respawn a new RMTFS daemon, to toggle the modem. But
> that's kind of cheating, and you can do that anyway, even without this
> patch.) On the contrary, your patch *would* resolve that, since the
> modem would notice when the RMTFS server goes away, and it would stop
> itself.

yeah we would want to mimic what the kernel
patch did with the exception of stopping modem
before bringing down the rmtfs server (not toggle
rproc state but start on rmtfs service up and stop
before rmtfs server exit). So in that case we would
not want the modem to auto-boot.

> 
>> https://patchwork.kernel.org/patch/10662395/
>> 
>> we should probably get this merged in, now that
>> we are planning to start/stop mss through
>> rmtfs.
> 
> Sorry, who's planning to stop mss through rmtfs? Did I miss something?

I have a working patch which I'll soon send
upstream for review, after it clears the internal
reviews/processes

> 
> Brian

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

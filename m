Return-Path: <pombredanne@nexb.com>
MIME-Version: 1.0
In-Reply-To: <20171201053510.GZ28761@minitux>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-3-bjorn.andersson@linaro.org> <CAOFm3uGR23XSfu3jS0r6=HwcQV1SZCqCrO6c1HQUTTg3dC9LJQ@mail.gmail.com>
 <20171201053510.GZ28761@minitux>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Fri, 1 Dec 2017 08:48:34 +0100
Message-ID: <CAOFm3uH9D-SF2gpR6c_Eyz1q=4vYwD6SLf_RnBA9p9C=c-9c9g@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] soc: qcom: Introduce QMI helpers
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Dec 1, 2017 at 6:35 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 30 Nov 00:18 PST 2017, Philippe Ombredanne wrote:
>
>> Bjorn,
>>
>> On Thu, Nov 30, 2017 at 2:16 AM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> []
>> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
>> > new file mode 100644
>> > index 000000000000..4027b52b0834
>> > --- /dev/null
>> > +++ b/drivers/soc/qcom/qmi_interface.c
>> > @@ -0,0 +1,857 @@
>> > +/*
>> > + * Copyright (C) 2017 Linaro Ltd.
>> > + *
>> > + * This software is licensed under the terms of the GNU General Public
>> > + * License version 2, as published by the Free Software Foundation, and
>> > + * may be copied, distributed, and modified under those terms.
>> > + *
>> > + * This program is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + * GNU General Public License for more details.
>> > + */
>>
>> Could it make sense, especially for new files, to use the new SPDX ids
>> and avoid adding boilerplate that will need to be cleaned up later?
>> e.g. something like this instead, using the new conventions started by
>> greg-kh and by documented tglx?
>>
>> NB: the // comment  style is not a mistake and is what Linus wants
>> there. See the threads on this topic.
>>
>> > @@ -0,0 +1,857 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * Copyright (C) 2017 Linaro Ltd.
>> > + */
>>
>> Isn't this shorter and better? :P
>>
>
> That sounds very reasonable, I will update the patches.

Note that when you only have a copyright left in a header comment
after removing the boilerplate, you might want to consider this even
shorter and cleaner form instead. But that's just me telling this:

>> > +// SPDX-License-Identifier: GPL-2.0
>> > +// Copyright (C) 2017 Linaro Ltd.

>> BTW, if you need help to fix this on the rest of Linaro contributed
>> code, I maintain a tool that can help there.
>>
>
> I haven't seen any guidelines on how this should be introduced
> throughout the kernel,

Thomas has sent a first doc patch [1] set. AFAIK he is working on an
updated version whenever his real time body clock yields a few ticks
so he can wrap this out.  But his real time clock only rarely yield
ticks outside of hard real time coding work ;)

Jonathan also wrote a nice background article on the topic at LWN [2].

I heard this was also briefly discussed among maintainers at the
plumbers meetup in Los Angeles: for me I only briefly discussed this
with Linus and Greg just before the meetup, but I could not stay
longer.

> should I make a similar push for the subsystems I
> maintain?

That would be great! And beside the fact it always feels good to
delete lines of code for once, this is one of the rare areas where you
can kill some lines and be pretty sure it will still compile and run
afterwards .... well.... in most cases: Greg and Thomas found funny
cases of .h headers included in assembly where using the // comment
style was actually making things break weirdly and the compilation
would go down in flames with a beautiful tail spin : in these cases,
the convention is to use /**/ comments instead)

Again, if you need help with this, I can modestly chip in with my
scancode-toolkit tool and good intentions.

[1] https://marc.info/?l=linux-kernel&m=151051532322831&w=2
[2] https://lwn.net/SubscriberLink/739183/262749cbe307ddc7/
-- 
Cordially
Philippe Ombredanne, a happy licensing comments cleaner

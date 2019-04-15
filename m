Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1553183239-13253-1-git-send-email-fabien.dessenne@st.com>
 <1553183239-13253-3-git-send-email-fabien.dessenne@st.com>
 <CAH2Cfb8K5hB=UeMOeTEXud1XZVp12Qbw9NYoxJ0XQK4FFuF3wQ@mail.gmail.com>
 <4857555a-812d-0b96-9a70-2984ffb50ca9@st.com> <CAH2Cfb8NzsOZDt8zBypY9ZiD6oOFWUBkZoPpKfU97ZRF_O0z+A@mail.gmail.com>
 <770c71bc-f387-62b6-f799-07ba6446e7e8@st.com> <CAH2Cfb87Wacgsh=xz9h9kgwYgBkxNBDbcDJ4W3uPs2LiKbTD9A@mail.gmail.com>
 <760819dc-4c26-b492-a0ba-8b27c189d5b1@st.com> <CAH2Cfb-EvWeP28W=Hqzvwaue55hBFCMecqvt3p8mRh52BZMdNg@mail.gmail.com>
 <596f9e4d-2db1-8040-211b-173ad19d9d0e@st.com> <CAH2Cfb87+MR5SNmm2zQU+44mV+3gTv4M2moFxQDXhEGHO00W+A@mail.gmail.com>
 <45511e33-df29-1a3c-66a1-151dc42bf10d@st.com> <CAH2Cfb9vJG=ujkB9G7P6OmgRZQUiKoH6DGfOu4NuwB+cnXOs1A@mail.gmail.com>
 <6351cde2-7470-40f5-9f3a-c872cb193e50@st.com> <0c1d34df-7aeb-648b-b118-cf608e6ba636@metux.net>
In-Reply-To: <0c1d34df-7aeb-648b-b118-cf608e6ba636@metux.net>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Mon, 15 Apr 2019 21:50:54 +0800
Message-ID: <CAH2Cfb-FHAQQcxOfvmD5VYxd6vKK1iCqN2oW5YLr80tCtCx=xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tty: add rpmsg driver
Content-Type: text/plain; charset="UTF-8"
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Apr 15, 2019 at 9:14 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 12.04.19 18:00, Arnaud Pouliquen wrote:
>
> Hi folks,
>
> <snip>
>
> Haven't followed the whole thread, but I've got the impression that the
> device is emulating an uart - if that's the case wouldn't it be better
> to implement a serial driver, instead of tty directly (which IMHO should
> make it also usable for serbus-based devices) ?

It's more natural to implement rpmsg uart on top of tty core instead
of serial layer, since:
1.Serial layer model the hardware which can just send the data one by one
2.But rpmsg could send a buffer(max 512B) in one packet
On the other hand, it's very easy to support serbus by replace
tty_port_register_device_attr to tty_port_register_device_attr_serdev.

>
>
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287

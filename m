Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1550116097-29710-1-git-send-email-xiaoxiang@xiaomi.com>
 <1550116097-29710-2-git-send-email-xiaoxiang@xiaomi.com> <242f03bc-ce43-7827-3621-57e052672dfe@infradead.org>
In-Reply-To: <242f03bc-ce43-7827-3621-57e052672dfe@infradead.org>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Thu, 14 Feb 2019 12:17:03 +0800
Message-ID: <CAH2Cfb_-X852mt-NhDPhVtAnAZ-2Fk4QGQ3yH2xjASfZiocgGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rpmsg: add syslog redirection driver
Content-Type: multipart/alternative; boundary="00000000000057c4e50581d2ef11"
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, alexander.shishkin@linux.intel.com, andriy.shevchenko@linux.intel.com, Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

--00000000000057c4e50581d2ef11
Content-Type: text/plain; charset="UTF-8"

Thanks, will fix all typo in the next patch.

On Thu, Feb 14, 2019 at 12:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> On 2/13/19 7:48 PM, Xiang Xiao wrote:
> > From: Guiding Li <liguiding@pinecone.net>
> >
> > This driver allows the remote processor redirect the output of
>
>                                 processor to redirect
>
> > syslog/printf into the kernel log, which is very useful to see
> > what happen in the remote side.
> >
> > Signed-off-by: Guiding Li <liguiding@pinecone.net>
> > ---
> >  drivers/rpmsg/Kconfig        |  12 ++++
> >  drivers/rpmsg/Makefile       |   1 +
> >  drivers/rpmsg/rpmsg_syslog.c | 163
> +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 drivers/rpmsg/rpmsg_syslog.c
> >
> > diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> > index d0322b4..d701614 100644
> > --- a/drivers/rpmsg/Kconfig
> > +++ b/drivers/rpmsg/Kconfig
> > @@ -15,6 +15,18 @@ config RPMSG_CHAR
> >         in /dev. They make it possible for user-space programs to send
> and
> >         receive rpmsg packets.
> >
> > +config RPMSG_SYSLOG
> > +     tristate "RPMSG syslog redirection"
> > +     depends on RPMSG
> > +     help
> > +       Say Y here to redirect the syslog/printf from remote processor
> into
> > +       the kernel log which is very useful to see what happen in the
> remote
>
>                                                  see what happens
>         or                                       see what happened
>
> > +       side.
> > +
> > +       If the remote processor hang during bootup or panic at the
> runtime,
>
>                                   hangs during bootup or panics during
> runtime,
>
>
> > +       We can even cat /sys/kernel/debug/remoteproc/remoteprocX/trace0
> to
>
>           we
>
> > +       get the last log which doesn't output yet.
>
>           get the last log which hasn't been output yet.
>
> > +
> >  config RPMSG_QCOM_GLINK_NATIVE
> >       tristate
> >       select RPMSG
>
> --
> ~Randy
>

--00000000000057c4e50581d2ef11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, will fix all typo in the next patch.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14=
, 2019 at 12:08 PM Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org=
">rdunlap@infradead.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 2/13/19 7:48 PM, Xiang Xiao wrote:<br>
&gt; From: Guiding Li &lt;<a href=3D"mailto:liguiding@pinecone.net" target=
=3D"_blank">liguiding@pinecone.net</a>&gt;<br>
&gt; <br>
&gt; This driver allows the remote processor redirect the output of<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processor to redirect<br>
<br>
&gt; syslog/printf into the kernel log, which is very useful to see<br>
&gt; what happen in the remote side.<br>
&gt; <br>
&gt; Signed-off-by: Guiding Li &lt;<a href=3D"mailto:liguiding@pinecone.net=
" target=3D"_blank">liguiding@pinecone.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/rpmsg/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++++=
<br>
&gt;=C2=A0 drivers/rpmsg/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 drivers/rpmsg/rpmsg_syslog.c | 163 +++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 3 files changed, 176 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/rpmsg/rpmsg_syslog.c<br>
&gt; <br>
&gt; diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig<br>
&gt; index d0322b4..d701614 100644<br>
&gt; --- a/drivers/rpmsg/Kconfig<br>
&gt; +++ b/drivers/rpmsg/Kconfig<br>
&gt; @@ -15,6 +15,18 @@ config RPMSG_CHAR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in /dev. They make it possible for us=
er-space programs to send and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0receive rpmsg packets.<br>
&gt;=C2=A0 <br>
&gt; +config RPMSG_SYSLOG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;RPMSG syslog redirection&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on RPMSG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to redirect the syslog/printf f=
rom remote processor into<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the kernel log which is very useful to see=
 what happen in the remote<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0see what happens<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 or=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0see what happened<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0side.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If the remote processor hang during bootup=
 or panic at the runtime,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hangs during bootup or panics=
 during runtime,<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0We can even cat /sys/kernel/debug/remotepr=
oc/remoteprocX/trace0 to<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 we<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0get the last log which doesn&#39;t output =
yet.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get the last log which hasn&#39;t been o=
utput yet.<br>
<br>
&gt; +<br>
&gt;=C2=A0 config RPMSG_QCOM_GLINK_NATIVE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select RPMSG<br>
<br>
-- <br>
~Randy<br>
</blockquote></div>

--00000000000057c4e50581d2ef11--

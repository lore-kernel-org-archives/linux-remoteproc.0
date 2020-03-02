Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20200214082638.92070-1-pihsun@chromium.org> <83b03af1-5518-599a-3f82-ee204992edbf@collabora.com>
 <CANdKZ0fuK1Nm_fPNKAss29pqghCcwjN3acYHi6Ez5==envgKgA@mail.gmail.com>
 <84a66ac1-c36a-fa72-a406-9c3396c1bdf2@collabora.com> <6c78727d-8a65-097d-224d-48d93f6ceaa7@collabora.com>
In-Reply-To: <6c78727d-8a65-097d-224d-48d93f6ceaa7@collabora.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 2 Mar 2020 13:51:31 +0800
Message-ID: <CANdKZ0cz5E=Fkyr-uKEiiey0_xnVCu3_Ogn5cqeq2pA+JXxr1g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_rpmsg: Fix race with host event.
Content-Type: multipart/alternative; boundary="0000000000008e43e9059fd8c919"
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, open list <linux-kernel@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

--0000000000008e43e9059fd8c919
Content-Type: text/plain; charset="UTF-8"

Hi Enric,

On Fri, Feb 28, 2020 at 4:52 PM Enric Balletbo i Serra <
enric.balletbo@collabora.com> wrote:

> Hi Pi-Hsun,
>
> On 17/2/20 16:55, Enric Balletbo i Serra wrote:
> > Dear remoteproc experts,
> >
> > cc'ing you for if we can have your feedback on this change.
> >
> > Thanks Pi-Hsun, for your quick answer, makes sense but I'm still feeling
> that I
> > miss something (probably because I'm not a remoteproc expert), so I
> added the
> > Remoteproc people for if they can comment this patch. We have time as
> we're in
> > rc2 only, so I'd like to wait a bit in case they can take a look.
> >
> > If no answer is received I'll take a second look and apply the patch.
> >
>
> I'll pick this patch, just I want to request a minor change.
>
> > Thanks,
> >  Enric
> >
> > On 15/2/20 4:56, Pi-Hsun Shih wrote:
> >> Hi Enric,
> >>
> >> On Fri, Feb 14, 2020 at 11:10 PM Enric Balletbo i Serra
> >> <enric.balletbo@collabora.com> wrote:
> >>>
> >>> Hi Pi-Hsun,
> >>>
> >>> On 14/2/20 9:26, Pi-Hsun Shih wrote:
> >>>> Host event can be sent by remoteproc by any time, and
> >>>> cros_ec_rpmsg_callback would be called after cros_ec_rpmsg_create_ept.
> >>>> But the cros_ec_device is initialized after that, which cause host
> event
> >>>> handler to use cros_ec_device that are not initialized properly yet.
> >>>>
> >>>
> >>> I don't have the hardware to test but, can't we call first
> cros_ec_register and
> >>> then cros_ec_rpmsg_create_ept?
> >>>
> >>> Start receiving driver callbacks before finishing to probe the drivers
> itself
> >>> sounds weird to me.
> >>>
> >>> Thanks,
> >>>  Enric
> >>
> >> Since cros_ec_register calls cros_ec_query_all, which sends message to
> >> remoteproc using cros_ec_pkt_xfer_rpmsg (to query protocol version),
> >> the ec_rpmsg->ept need to be ready before calling cros_ec_register.
> >>
> >>>
> >>>> Fix this by don't schedule host event handler before cros_ec_register
> >>>> returns. Instead, remember that we have a pending host event, and
> >>>> schedule host event handler after cros_ec_register.
> >>>>
> >>>> Fixes: 71cddb7097e2 ("platform/chrome: cros_ec_rpmsg: Fix race with
> host command when probe failed.")
> >>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >>>> ---
> >>>>  drivers/platform/chrome/cros_ec_rpmsg.c | 16 +++++++++++++++-
> >>>>  1 file changed, 15 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c
> b/drivers/platform/chrome/cros_ec_rpmsg.c
> >>>> index dbc3f5523b83..7e8629e3db74 100644
> >>>> --- a/drivers/platform/chrome/cros_ec_rpmsg.c
> >>>> +++ b/drivers/platform/chrome/cros_ec_rpmsg.c
> >>>> @@ -44,6 +44,8 @@ struct cros_ec_rpmsg {
> >>>>       struct completion xfer_ack;
> >>>>       struct work_struct host_event_work;
> >>>>       struct rpmsg_endpoint *ept;
> >>>> +     bool has_pending_host_event;
> >>>> +     bool probe_done;
>
>
> Could you try if just calling driver_probe_done() when needed works, so we
> don't
> need to add a new boolean flag for this?
>

Changing from "if (ec_rpmsg->probe_done)" to "if (driver_probe_done() ==
0)" works in my testing.

But since driver_probe_done() returns 0 after all driver probes are done,
not after the probe of cros_ec_rpmsg driver, I think it's possible that we
got a host event after the cros_ec_rpmsg driver probe is done
(ec_rpmsg->probe_done is true), but before all driver probe done
(driver_probe_done() is still -EBUSY). In this case the host event would be
lost since we would set the has_pending_host_event flag but no one would be
processing it.


>
> Thanks,
>  Enric
>
> >>>>  };
> >>>>
> >>>>  /**
> >>>> @@ -177,7 +179,14 @@ static int cros_ec_rpmsg_callback(struct
> rpmsg_device *rpdev, void *data,
> >>>>               memcpy(ec_dev->din, resp->data, len);
> >>>>               complete(&ec_rpmsg->xfer_ack);
> >>>>       } else if (resp->type == HOST_EVENT_MARK) {
> >>>> -             schedule_work(&ec_rpmsg->host_event_work);
> >>>> +             /*
> >>>> +              * If the host event is sent before cros_ec_register is
> >>>> +              * finished, queue the host event.
> >>>> +              */
> >>>> +             if (ec_rpmsg->probe_done)
> >>>> +                     schedule_work(&ec_rpmsg->host_event_work);
> >>>> +             else
> >>>> +                     ec_rpmsg->has_pending_host_event = true;
> >>>>       } else {
> >>>>               dev_warn(ec_dev->dev, "rpmsg received invalid type =
> %d",
> >>>>                        resp->type);
> >>>> @@ -240,6 +249,11 @@ static int cros_ec_rpmsg_probe(struct
> rpmsg_device *rpdev)
> >>>>               return ret;
> >>>>       }
> >>>>
> >>>> +     ec_rpmsg->probe_done = true;
> >>>> +
> >>>> +     if (ec_rpmsg->has_pending_host_event)
> >>>> +             schedule_work(&ec_rpmsg->host_event_work);
> >>>> +
> >>>>       return 0;
> >>>>  }
> >>>>
> >>>>
> >>>> base-commit: b19e8c68470385dd2c5440876591fddb02c8c402
> >>>>
>

--0000000000008e43e9059fd8c919
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Enric,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 4:52 PM Enric Ballet=
bo i Serra &lt;<a href=3D"mailto:enric.balletbo@collabora.com">enric.ballet=
bo@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Pi-Hsun,<br>
<br>
On 17/2/20 16:55, Enric Balletbo i Serra wrote:<br>
&gt; Dear remoteproc experts,<br>
&gt; <br>
&gt; cc&#39;ing you for if we can have your feedback on this change.<br>
&gt; <br>
&gt; Thanks Pi-Hsun, for your quick answer, makes sense but I&#39;m still f=
eeling that I<br>
&gt; miss something (probably because I&#39;m not a remoteproc expert), so =
I added the<br>
&gt; Remoteproc people for if they can comment this patch. We have time as =
we&#39;re in<br>
&gt; rc2 only, so I&#39;d like to wait a bit in case they can take a look.<=
br>
&gt; <br>
&gt; If no answer is received I&#39;ll take a second look and apply the pat=
ch.<br>
&gt; <br>
<br>
I&#39;ll pick this patch, just I want to request a minor change.<br>
<br>
&gt; Thanks,<br>
&gt;=C2=A0 Enric<br>
&gt; <br>
&gt; On 15/2/20 4:56, Pi-Hsun Shih wrote:<br>
&gt;&gt; Hi Enric,<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Feb 14, 2020 at 11:10 PM Enric Balletbo i Serra<br>
&gt;&gt; &lt;<a href=3D"mailto:enric.balletbo@collabora.com" target=3D"_bla=
nk">enric.balletbo@collabora.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Pi-Hsun,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 14/2/20 9:26, Pi-Hsun Shih wrote:<br>
&gt;&gt;&gt;&gt; Host event can be sent by remoteproc by any time, and<br>
&gt;&gt;&gt;&gt; cros_ec_rpmsg_callback would be called after cros_ec_rpmsg=
_create_ept.<br>
&gt;&gt;&gt;&gt; But the cros_ec_device is initialized after that, which ca=
use host event<br>
&gt;&gt;&gt;&gt; handler to use cros_ec_device that are not initialized pro=
perly yet.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t have the hardware to test but, can&#39;t we call f=
irst cros_ec_register and<br>
&gt;&gt;&gt; then cros_ec_rpmsg_create_ept?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Start receiving driver callbacks before finishing to probe the=
 drivers itself<br>
&gt;&gt;&gt; sounds weird to me.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;=C2=A0 Enric<br>
&gt;&gt;<br>
&gt;&gt; Since cros_ec_register calls cros_ec_query_all, which sends messag=
e to<br>
&gt;&gt; remoteproc using cros_ec_pkt_xfer_rpmsg (to query protocol version=
),<br>
&gt;&gt; the ec_rpmsg-&gt;ept need to be ready before calling cros_ec_regis=
ter.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fix this by don&#39;t schedule host event handler before c=
ros_ec_register<br>
&gt;&gt;&gt;&gt; returns. Instead, remember that we have a pending host eve=
nt, and<br>
&gt;&gt;&gt;&gt; schedule host event handler after cros_ec_register.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fixes: 71cddb7097e2 (&quot;platform/chrome: cros_ec_rpmsg:=
 Fix race with host command when probe failed.&quot;)<br>
&gt;&gt;&gt;&gt; Signed-off-by: Pi-Hsun Shih &lt;<a href=3D"mailto:pihsun@c=
hromium.org" target=3D"_blank">pihsun@chromium.org</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 drivers/platform/chrome/cros_ec_rpmsg.c | 16 +++++++=
++++++++-<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 15 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/dri=
vers/platform/chrome/cros_ec_rpmsg.c<br>
&gt;&gt;&gt;&gt; index dbc3f5523b83..7e8629e3db74 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/platform/chrome/cros_ec_rpmsg.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/platform/chrome/cros_ec_rpmsg.c<br>
&gt;&gt;&gt;&gt; @@ -44,6 +44,8 @@ struct cros_ec_rpmsg {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion xfer_ack;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct host_event_wo=
rk;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rpmsg_endpoint *ept;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0bool has_pending_host_event;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0bool probe_done;<br>
<br>
<br>
Could you try if just calling driver_probe_done() when needed works, so we =
don&#39;t<br>
need to add a new boolean flag for this?<br></blockquote><div><br></div><di=
v>Changing from &quot;if (ec_rpmsg-&gt;probe_done)&quot; to &quot;if (drive=
r_probe_done() =3D=3D 0)&quot; works in my testing.</div><div><br></div><di=
v>But since=C2=A0driver_probe_done() returns 0 after all driver probes are =
done, not after the probe of cros_ec_rpmsg driver, I think it&#39;s possibl=
e that we got a host event after the cros_ec_rpmsg driver probe is done (ec=
_rpmsg-&gt;probe_done is true), but before all driver probe done (driver_pr=
obe_done() is still -EBUSY). In this case the host event would be lost sinc=
e we would set the has_pending_host_event flag but no one would be processi=
ng it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Thanks,<br>
=C2=A0Enric<br>
<br>
&gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 /**<br>
&gt;&gt;&gt;&gt; @@ -177,7 +179,14 @@ static int cros_ec_rpmsg_callback(str=
uct rpmsg_device *rpdev, void *data,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memc=
py(ec_dev-&gt;din, resp-&gt;data, len);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp=
lete(&amp;ec_rpmsg-&gt;xfer_ack);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (resp-&gt;type =3D=3D =
HOST_EVENT_MARK) {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule_=
work(&amp;ec_rpmsg-&gt;host_event_work);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the=
 host event is sent before cros_ec_register is<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * finish=
ed, queue the host event.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ec_rp=
msg-&gt;probe_done)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0schedule_work(&amp;ec_rpmsg-&gt;host_event_work);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ec_rpmsg-&gt;has_pending_host_event =3D true;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_=
warn(ec_dev-&gt;dev, &quot;rpmsg received invalid type =3D %d&quot;,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 resp-&gt;type);<br>
&gt;&gt;&gt;&gt; @@ -240,6 +249,11 @@ static int cros_ec_rpmsg_probe(struct=
 rpmsg_device *rpdev)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn ret;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0ec_rpmsg-&gt;probe_done =3D true;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (ec_rpmsg-&gt;has_pending_host_eve=
nt)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule_=
work(&amp;ec_rpmsg-&gt;host_event_work);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; base-commit: b19e8c68470385dd2c5440876591fddb02c8c402<br>
&gt;&gt;&gt;&gt;<br>
</blockquote></div></div>

--0000000000008e43e9059fd8c919--

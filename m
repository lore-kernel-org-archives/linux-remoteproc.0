Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABb+yY0beZmy8qSsxLoikKeXnijmded4oGRrckW+jZEqKV9jPw@mail.gmail.com>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org> <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux> <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org> <CABb+yY3fcFkVfJX0CuBenDLek7ew80HFAKLxtthrhBLWJZv5Kw@mail.gmail.com>
 <CABb+yY2jHER98Mtfigg9rwA5PGsZt2UMm=5SWhrqvsqF-Yai=Q@mail.gmail.com>
 <CABb+yY3XW3HmJop0cJ2NZzqCtkWtvKgco9ecUt8890DKpZeaag@mail.gmail.com> <CABb+yY0beZmy8qSsxLoikKeXnijmded4oGRrckW+jZEqKV9jPw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 6 May 2017 01:41:26 +0530
Message-ID: <CABb+yY3aHG73YfQ9O0ovrQaX5Pq2d0A1srv_8za0dajMGeiixw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: multipart/alternative; boundary=f403045c2454983be2054ecc7efe
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-soc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

--f403045c2454983be2054ecc7efe
Content-Type: text/plain; charset=UTF-8

On 6 May 2017 01:23, "Jeffrey Hugo" <jhugo@codeaurora.org> wrote:

On 5/5/2017 1:22 PM, Jassi Brar wrote:

> On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>
>> On Fri 05 May 03:26 PDT 2017, Jassi Brar wrote:
>>
>> On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
>>> <bjorn.andersson@linaro.org> wrote:
>>>
>>> +
>>>> +static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
>>>> +{
>>>> +       struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
>>>> +                                                 struct qcom_apcs_ipc,
>>>> mbox);
>>>> +       unsigned long idx = (unsigned long)chan->con_priv;
>>>> +
>>>> +       writel(BIT(idx), apcs->base + apcs->offset);
>>>> +
>>>>
>>> When/how does this bit get ever cleared again?
>>> You may want to add last_tx_done() callback to check if this bit is
>>> cleared before you can send the next interrupt. And set
>>> txdone_poll/irq accordingly.
>>>
>>>
>> It's a write-only register, writing a bit fires off an edge triggered
>> interrupt on the specific remote processor, which will ack the
>> associated IRQ status and handle the interrupt.
>>
>> As the "message" is just a notification to the other side that it needs
>> to act on "something", there's no harm in notifying it multiple times
>> before it has a chance to ack the IRQ and a write after that will be
>> seen as a separate interrupt.
>>
>> What causes it to return to '0'?
>

Technically nothing.  This is not a traditional register.  Its an address
that is modeled as a register that the hardware knows, when 1 is written to
the specific bit, the hardware is to take a specific action (generate the
interrupt).

As Bjorn stated, its a write only address.  The hardware documentation
states not to read it.  On most platforms, if you attempt to read the
address, you will always get 0, although that is not guaranteed, and there
have been platforms where attempting to read the address will result in a
bus hang.

Conceptually, the hardware automatically resets it to "0" in the next clock
cycle.  Software doesn't need to care.



> I think the driver should wait for it to become 0 before writing 1.
> For example, the protocol has a command that says to remote cpu to
> increase the voltage supply by 0.1v. This command is filled in a
> structure and laid out in the shared memory before you ring the
> 'doorbell'.  In this situation you don't want the remote cpu to act
> twice on the same command. Also for a new command, you don't want to
> overwrite the last command packet before remote cpu has consumed it.
>

That doesn't apply here.  The doorbell in this case is a signal for the
remote processor to go look at the FIFO in shared memory.  Since interrupts
can be lost (ie the local processor sends multiple interrupts before the
remote processor can service them, so the GIC drops them since the
interrupt is already pending), the remote processor is required to drain
the FIFO when it processes the interrupt.

There is no way to determine if the remote processor has observed a
message, that does not involve pretty trivial race conditions.


Thanks for chiming in.
How is it supposed to work if a client queues more than one request? How do
you know when it's ok to overwrite the FIFO and send the next command?







I invented this protocol.  From what I've seen (granted I did not do a
thorough review), Bjorn is doing the correct thing here.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies,
Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

--f403045c2454983be2054ecc7efe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 6 May 2017 01:23, &quot;Jeffrey Hugo&quot; &lt;<a href=3D"mail=
to:jhugo@codeaurora.org">jhugo@codeaurora.org</a>&gt; wrote:<br type=3D"att=
ribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div class=3D"elided-text">On 5/5/2017 1=
:22 PM, Jassi Brar wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson<br>
&lt;<a href=3D"mailto:bjorn.andersson@linaro.org" target=3D"_blank">bjorn.a=
ndersson@linaro.org</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri 05 May 03:26 PDT 2017, Jassi Brar wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson<br>
&lt;<a href=3D"mailto:bjorn.andersson@linaro.org" target=3D"_blank">bjorn.a=
ndersson@linaro.org</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct qcom_apcs_ipc *apcs =3D container_of(cha=
n-&gt;mbox,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct qcom_apcs_ipc, mbox);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long idx =3D (unsigned long)chan-&gt;c=
on_priv;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(BIT(idx), apcs-&gt;base + apcs-&gt;offse=
t);<br>
+<br>
</blockquote>
When/how does this bit get ever cleared again?<br>
You may want to add last_tx_done() callback to check if this bit is<br>
cleared before you can send the next interrupt. And set<br>
txdone_poll/irq accordingly.<br>
<br>
</blockquote>
<br>
It&#39;s a write-only register, writing a bit fires off an edge triggered<b=
r>
interrupt on the specific remote processor, which will ack the<br>
associated IRQ status and handle the interrupt.<br>
<br>
As the &quot;message&quot; is just a notification to the other side that it=
 needs<br>
to act on &quot;something&quot;, there&#39;s no harm in notifying it multip=
le times<br>
before it has a chance to ack the IRQ and a write after that will be<br>
seen as a separate interrupt.<br>
<br>
</blockquote>
What causes it to return to &#39;0&#39;?<br>
</blockquote>
<br></div>
Technically nothing.=C2=A0 This is not a traditional register.=C2=A0 Its an=
 address that is modeled as a register that the hardware knows, when 1 is w=
ritten to the specific bit, the hardware is to take a specific action (gene=
rate the interrupt).<br>
<br>
As Bjorn stated, its a write only address.=C2=A0 The hardware documentation=
 states not to read it.=C2=A0 On most platforms, if you attempt to read the=
 address, you will always get 0, although that is not guaranteed, and there=
 have been platforms where attempting to read the address will result in a =
bus hang.<br>
<br>
Conceptually, the hardware automatically resets it to &quot;0&quot; in the =
next clock cycle.=C2=A0 Software doesn&#39;t need to care.<div class=3D"quo=
ted-text"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I think the driver should wait for it to become 0 before writing 1.<br>
For example, the protocol has a command that says to remote cpu to<br>
increase the voltage supply by 0.1v. This command is filled in a<br>
structure and laid out in the shared memory before you ring the<br>
&#39;doorbell&#39;.=C2=A0 In this situation you don&#39;t want the remote c=
pu to act<br>
twice on the same command. Also for a new command, you don&#39;t want to<br=
>
overwrite the last command packet before remote cpu has consumed it.<br>
</blockquote>
<br></div>
That doesn&#39;t apply here.=C2=A0 The doorbell in this case is a signal fo=
r the remote processor to go look at the FIFO in shared memory.=C2=A0 Since=
 interrupts can be lost (ie the local processor sends multiple interrupts b=
efore the remote processor can service them, so the GIC drops them since th=
e interrupt is already pending), the remote processor is required to drain =
the FIFO when it processes the interrupt.<br>
<br>
There is no way to determine if the remote processor has observed a message=
, that does not involve pretty trivial race conditions.<br></blockquote></d=
iv></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for chi=
ming in.</div><div dir=3D"auto">How is it supposed to work if a client queu=
es more than one request? How do you know when it&#39;s ok to overwrite the=
 FIFO and send the next command?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br><br>
I invented this protocol.=C2=A0 From what I&#39;ve seen (granted I did not =
do a thorough review), Bjorn is doing the correct thing here.<font color=3D=
"#888888"><br>
<br>
-- <br>
Jeffrey Hugo<br>
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, =
Inc.<br>
Qualcomm Technologies, Inc. is a member of the<br>
Code Aurora Forum, a Linux Foundation Collaborative Project.<br>
</font></blockquote></div><br></div></div></div>

--f403045c2454983be2054ecc7efe--

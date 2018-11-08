Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH] remoteproc: debug: remove strlen call in rproc_trace_read
Date: Thu, 8 Nov 2018 08:10:42 +0000
Message-ID: <dd787fb20dfc4a2d868bb9a6ad7e4dae@SFHDAG7NODE2.st.com>
References: <1541603184-26652-1-git-send-email-xiaoxiang@xiaomi.com>
 <20181108061355.GX12063@builder>
In-Reply-To: <20181108061355.GX12063@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>, Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Bjorn Andersson
> Sent: jeudi 8 novembre 2018 07:14
> To: Suman Anna <s-anna@ti.com>; Xiang Xiao
> <xiaoxiang781216@gmail.com>
> Cc: linux-remoteproc@vger.kernel.org; Xiang Xiao <xiaoxiang@xiaomi.com>
> Subject: Re: [PATCH] remoteproc: debug: remove strlen call in
> rproc_trace_read
>=20
> On Wed 07 Nov 07:06 PST 2018, Xiang Xiao wrote:
>=20
> > because the trace buffer may contain the binary data
> >
>=20
> I think this patch is good.

It isn't for me as trace buffer is only used for printf like traces. If we =
read past the first \0 we will display some noise and depending on trace bu=
ffer size make trace buffer unreadable on console thanks to a basic 'cat'.
But I recognize binary trace format need.
I would suggest to add a parameter in trace resource to specify the type of=
 trace: text or binary and adapt function behavior according to this.

Regards,
Loic
>=20
> @Suman, as I know you're using this and would now read past the first \0
> in the buffer, do you have any objections to it?
>=20
> Regards,
> Bjorn
>=20
> > Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> > ---
> >  drivers/remoteproc/remoteproc_debugfs.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_debugfs.c
> b/drivers/remoteproc/remoteproc_debugfs.c
> > index e90135c..0808466 100644
> > --- a/drivers/remoteproc/remoteproc_debugfs.c
> > +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > @@ -48,9 +48,8 @@ static ssize_t rproc_trace_read(struct file *filp, ch=
ar
> __user *userbuf,
> >  				size_t count, loff_t *ppos)
> >  {
> >  	struct rproc_mem_entry *trace =3D filp->private_data;
> > -	int len =3D strnlen(trace->va, trace->len);
> >
> > -	return simple_read_from_buffer(userbuf, count, ppos, trace->va,
> len);
> > +	return simple_read_from_buffer(userbuf, count, ppos, trace->va,
> trace->len);
> >  }
> >
> >  static const struct file_operations trace_rproc_ops =3D {
> > --
> > 2.7.4
> >

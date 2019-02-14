Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com> <20190214125347.GU9224@smile.fi.intel.com>
In-Reply-To: <20190214125347.GU9224@smile.fi.intel.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Thu, 14 Feb 2019 23:42:36 +0800
Message-ID: <CAH2Cfb_pg8x0DVb487H0HvuqB-hGV_cAt1Bqi4Uq0XhtYCzhYQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] lib/string: add memrchr function
Content-Type: multipart/alternative; boundary="000000000000a4c7650581dc82e4"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, alexander.shishkin@linux.intel.com, Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

--000000000000a4c7650581dc82e4
Content-Type: text/plain; charset="UTF-8"

Will fix in the next revision.

On Thu, Feb 14, 2019 at 8:53 PM Andy Shevchenko <
andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Feb 14, 2019 at 02:02:37PM +0800, Xiang Xiao wrote:
> > Here is the detailed description for memrchr:
> >
> > void *memrchr(const void *s, int c, size_t n);
> >
> > The memrchr() function is like the memchr() function, except
> > that it searches backward from the end of the n bytes pointed
> > to by s instead of forward from the beginning.
> >
> > The memrchr() functions return a pointer to the matching byte
> > or NULL if the character does not occur in the given memory
> > area.
>
> > +void *memrchr(const void *s, int c, size_t n)
> > +{
> > +     const unsigned char *p = s + n;
> > +
> > +     while (n-- != 0) {
>
> Simple:
>
>         while (n--) {
>
> > +             if ((unsigned char)c == *--p)
> > +                     return (void *)p;
> > +     }
> > +     return NULL;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

--000000000000a4c7650581dc82e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will fix in the next revision.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019 at 8:53=
 PM Andy Shevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com=
">andriy.shevchenko@linux.intel.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, Feb 14, 2019 at 02:02:37PM +0800=
, Xiang Xiao wrote:<br>
&gt; Here is the detailed description for memrchr:<br>
&gt; <br>
&gt; void *memrchr(const void *s, int c, size_t n);<br>
&gt; <br>
&gt; The memrchr() function is like the memchr() function, except<br>
&gt; that it searches backward from the end of the n bytes pointed<br>
&gt; to by s instead of forward from the beginning.<br>
&gt; <br>
&gt; The memrchr() functions return a pointer to the matching byte<br>
&gt; or NULL if the character does not occur in the given memory<br>
&gt; area.<br>
<br>
&gt; +void *memrchr(const void *s, int c, size_t n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const unsigned char *p =3D s + n;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (n-- !=3D 0) {<br>
<br>
Simple:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (n--) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((unsigned char)c =
=3D=3D *--p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (void *)p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +}<br>
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br>
</blockquote></div>

--000000000000a4c7650581dc82e4--

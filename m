Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1550116097-29710-1-git-send-email-xiaoxiang@xiaomi.com> <f4742c3c-ca55-d90f-7056-b340eea5160b@infradead.org>
In-Reply-To: <f4742c3c-ca55-d90f-7056-b340eea5160b@infradead.org>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Thu, 14 Feb 2019 12:15:02 +0800
Message-ID: <CAH2Cfb9_R=GJwQEfd0riJeNdr09U4T9dg9BQvuBiW0Mu_nKtMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string: add memrchr function
Content-Type: multipart/alternative; boundary="0000000000001ad4e70581d2e807"
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, alexander.shishkin@linux.intel.com, andriy.shevchenko@linux.intel.com, Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

--0000000000001ad4e70581d2e807
Content-Type: text/plain; charset="UTF-8"

Thanks, will fix all issues in the next review.

On Thu, Feb 14, 2019 at 12:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> On 2/13/19 7:48 PM, Xiang Xiao wrote:
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
> >
> > Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> > ---
> >  include/linux/string.h |  1 +
> >  lib/string.c           | 21 +++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index 7927b87..f380f4b 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -167,6 +167,7 @@ static inline void memcpy_flushcache(void *dst,
> const void *src, size_t cnt)
> >       memcpy(dst, src, cnt);
> >  }
> >  #endif
> > +void *memrchr(const void *s, int c, size_t n);
> >  void *memchr_inv(const void *s, int c, size_t n);
> >  char *strreplace(char *s, char old, char new);
> >
> > diff --git a/lib/string.c b/lib/string.c
> > index 38e4ca0..92914f6 100644
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -964,6 +964,27 @@ void *memchr(const void *s, int c, size_t n)
> >  EXPORT_SYMBOL(memchr);
> >  #endif
> >
> > +/**
> > + * memrchr - Find a character in an area of memory.
>
> This should say up front that this is a reverse search, from the end of
> the memory area backwards.
>
> > + * @s: The memory area
> > + * @c: The byte to search for
> > + * @n: The size of the area.
> > + *
> > + * returns the address of the last occurrence of @c, or %NULL
>
>     * Return: the address of the last occurrence of @c, or %NULL
>
> > + * if @c is not found
> > + */
> > +void *memrchr(const void *s, int c, size_t n)
> > +{
> > +     const unsigned char *p = s + n;
> > +
> > +     while (n-- != 0) {
> > +             if ((unsigned char)c == *--p)
> > +                     return (void *)p;
> > +     }
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL(memrchr);
> > +
> >  static void *check_bytes8(const u8 *start, u8 value, unsigned int bytes)
> >  {
> >       while (bytes) {
> >
>
>
> --
> ~Randy
>

--0000000000001ad4e70581d2e807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, will fix all issues in the next review.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb=
 14, 2019 at 12:08 PM Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.=
org">rdunlap@infradead.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 2/13/19 7:48 PM, Xiang Xiao wrote:<br>
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
&gt; <br>
&gt; Signed-off-by: Xiang Xiao &lt;<a href=3D"mailto:xiaoxiang@xiaomi.com" =
target=3D"_blank">xiaoxiang@xiaomi.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/linux/string.h |=C2=A0 1 +<br>
&gt;=C2=A0 lib/string.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++=
+++++++++++++++<br>
&gt;=C2=A0 2 files changed, 22 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/linux/string.h b/include/linux/string.h<br>
&gt; index 7927b87..f380f4b 100644<br>
&gt; --- a/include/linux/string.h<br>
&gt; +++ b/include/linux/string.h<br>
&gt; @@ -167,6 +167,7 @@ static inline void memcpy_flushcache(void *dst, co=
nst void *src, size_t cnt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(dst, src, cnt);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt; +void *memrchr(const void *s, int c, size_t n);<br>
&gt;=C2=A0 void *memchr_inv(const void *s, int c, size_t n);<br>
&gt;=C2=A0 char *strreplace(char *s, char old, char new);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/lib/string.c b/lib/string.c<br>
&gt; index 38e4ca0..92914f6 100644<br>
&gt; --- a/lib/string.c<br>
&gt; +++ b/lib/string.c<br>
&gt; @@ -964,6 +964,27 @@ void *memchr(const void *s, int c, size_t n)<br>
&gt;=C2=A0 EXPORT_SYMBOL(memchr);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * memrchr - Find a character in an area of memory.<br>
<br>
This should say up front that this is a reverse search, from the end of<br>
the memory area backwards.<br>
<br>
&gt; + * @s: The memory area<br>
&gt; + * @c: The byte to search for<br>
&gt; + * @n: The size of the area.<br>
&gt; + *<br>
&gt; + * returns the address of the last occurrence of @c, or %NULL<br>
<br>
=C2=A0 =C2=A0 * Return: the address of the last occurrence of @c, or %NULL<=
br>
<br>
&gt; + * if @c is not found<br>
&gt; + */<br>
&gt; +void *memrchr(const void *s, int c, size_t n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const unsigned char *p =3D s + n;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (n-- !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((unsigned char)c =
=3D=3D *--p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return (void *)p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(memrchr);<br>
&gt; +<br>
&gt;=C2=A0 static void *check_bytes8(const u8 *start, u8 value, unsigned in=
t bytes)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0while (bytes) {<br>
&gt; <br>
<br>
<br>
-- <br>
~Randy<br>
</blockquote></div>

--0000000000001ad4e70581d2e807--

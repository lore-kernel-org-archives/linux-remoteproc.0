Return-Path: <alex.elder@linaro.org>
MIME-Version: 1.0
References: <20180626013409.5125-1-elder@linaro.org> <20180626013409.5125-2-elder@linaro.org>
 <20180626022259.GH1860@tuxbook-pro>
In-Reply-To: <20180626022259.GH1860@tuxbook-pro>
From: Alex Elder <elder@linaro.org>
Date: Mon, 25 Jun 2018 22:04:56 -0500
Message-ID: <CAHct6q03+XJaEeb-KR4imUW2V56VmwCN_qY0YMh0yR0PsR2enA@mail.gmail.com>
Subject: Re: [PATCH resend 1/5] remoteproc: Rename subdev functions to start/stop
Content-Type: multipart/alternative; boundary="000000000000c5d57e056f82c30a"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

--000000000000c5d57e056f82c30a
Content-Type: text/plain; charset="UTF-8"

Sorry about that. I will take care if it in the morning.
Feel free to edit yourself, I certify it either way.

     -Alex


On Mon, Jun 25, 2018, 9:20 PM Bjorn Andersson <bjorn.andersson@linaro.org>
wrote:

> On Mon 25 Jun 18:34 PDT 2018, Alex Elder wrote:
>
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > "start" and "stop" are more suitable names for how these two operations
> > are used, and they fit better with the upcoming introduction of two
> > additional operations in the struct.
> >
> > [elder@linaro.org: minor comment edits]
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Acked-by: Alex Elder <elder@linaro.org>
> > Tested-by: Fabien Dessenne <fabien.dessenne@st.com>
>
> Sorry for not spotting this before, but per section 11 of
> Documentation/process/submitting-patches.rst the tag part should read:
>
>
> Tested-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [elder@linaro.org: minor comment edits]
> Signed-off-by: Alex Elder <elder@linaro.org>
>
>
> I.e. as you're sending the email you must be the last one certifying the
> origin of the patch.
>
> Regards,
> Bjorn
>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++--------------
> >  include/linux/remoteproc.h           | 14 ++++++-------
> >  2 files changed, 22 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index a9609d971f7f..5dd58e6bea88 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -774,13 +774,13 @@ static int rproc_handle_resources(struct rproc
> *rproc,
> >       return ret;
> >  }
> >
> > -static int rproc_probe_subdevices(struct rproc *rproc)
> > +static int rproc_start_subdevices(struct rproc *rproc)
> >  {
> >       struct rproc_subdev *subdev;
> >       int ret;
> >
> >       list_for_each_entry(subdev, &rproc->subdevs, node) {
> > -             ret = subdev->probe(subdev);
> > +             ret = subdev->start(subdev);
> >               if (ret)
> >                       goto unroll_registration;
> >       }
> > @@ -789,17 +789,17 @@ static int rproc_probe_subdevices(struct rproc
> *rproc)
> >
> >  unroll_registration:
> >       list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
> > -             subdev->remove(subdev, true);
> > +             subdev->stop(subdev, true);
> >
> >       return ret;
> >  }
> >
> > -static void rproc_remove_subdevices(struct rproc *rproc, bool crashed)
> > +static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
> >  {
> >       struct rproc_subdev *subdev;
> >
> >       list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
> > -             subdev->remove(subdev, crashed);
> > +             subdev->stop(subdev, crashed);
> >  }
> >
> >  /**
> > @@ -901,8 +901,8 @@ static int rproc_start(struct rproc *rproc, const
> struct firmware *fw)
> >               return ret;
> >       }
> >
> > -     /* probe any subdevices for the remote processor */
> > -     ret = rproc_probe_subdevices(rproc);
> > +     /* Start any subdevices for the remote processor */
> > +     ret = rproc_start_subdevices(rproc);
> >       if (ret) {
> >               dev_err(dev, "failed to probe subdevices for %s: %d\n",
> >                       rproc->name, ret);
> > @@ -1014,8 +1014,8 @@ static int rproc_stop(struct rproc *rproc, bool
> crashed)
> >       struct device *dev = &rproc->dev;
> >       int ret;
> >
> > -     /* remove any subdevices for the remote processor */
> > -     rproc_remove_subdevices(rproc, crashed);
> > +     /* Stop any subdevices for the remote processor */
> > +     rproc_stop_subdevices(rproc, crashed);
> >
> >       /* the installed resource table is no longer accessible */
> >       rproc->table_ptr = rproc->cached_table;
> > @@ -1657,16 +1657,16 @@ EXPORT_SYMBOL(rproc_del);
> >   * rproc_add_subdev() - add a subdevice to a remoteproc
> >   * @rproc: rproc handle to add the subdevice to
> >   * @subdev: subdev handle to register
> > - * @probe: function to call when the rproc boots
> > - * @remove: function to call when the rproc shuts down
> > + * @start: function to call after the rproc is started
> > + * @stop: function to call before the rproc is stopped
> >   */
> >  void rproc_add_subdev(struct rproc *rproc,
> >                     struct rproc_subdev *subdev,
> > -                   int (*probe)(struct rproc_subdev *subdev),
> > -                   void (*remove)(struct rproc_subdev *subdev, bool
> crashed))
> > +                   int (*start)(struct rproc_subdev *subdev),
> > +                   void (*stop)(struct rproc_subdev *subdev, bool
> crashed))
> >  {
> > -     subdev->probe = probe;
> > -     subdev->remove = remove;
> > +     subdev->start = start;
> > +     subdev->stop = stop;
> >
> >       list_add_tail(&subdev->node, &rproc->subdevs);
> >  }
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index dfdaede9139e..bf55bf2a5ee1 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -477,15 +477,15 @@ struct rproc {
> >  /**
> >   * struct rproc_subdev - subdevice tied to a remoteproc
> >   * @node: list node related to the rproc subdevs list
> > - * @probe: probe function, called as the rproc is started
> > - * @remove: remove function, called as the rproc is being stopped, the
> @crashed
> > - *       parameter indicates if this originates from the a recovery
> > + * @start: start function, called after the rproc has been started
> > + * @stop: stop function, called before the rproc is stopped; the
> @crashed
> > + *       parameter indicates if this originates from a recovery
> >   */
> >  struct rproc_subdev {
> >       struct list_head node;
> >
> > -     int (*probe)(struct rproc_subdev *subdev);
> > -     void (*remove)(struct rproc_subdev *subdev, bool crashed);
> > +     int (*start)(struct rproc_subdev *subdev);
> > +     void (*stop)(struct rproc_subdev *subdev, bool crashed);
> >  };
> >
> >  /* we currently support only two vrings per rvdev */
> > @@ -568,8 +568,8 @@ static inline struct rproc *vdev_to_rproc(struct
> virtio_device *vdev)
> >
> >  void rproc_add_subdev(struct rproc *rproc,
> >                     struct rproc_subdev *subdev,
> > -                   int (*probe)(struct rproc_subdev *subdev),
> > -                   void (*remove)(struct rproc_subdev *subdev, bool
> crashed));
> > +                   int (*start)(struct rproc_subdev *subdev),
> > +                   void (*stop)(struct rproc_subdev *subdev, bool
> crashed));
> >
> >  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev
> *subdev);
> >
> > --
> > 2.17.1
> >
>

--000000000000c5d57e056f82c30a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sorry about that. I will take care if it in the morning.<=
div dir=3D"auto">Feel free to edit yourself, I certify it either way.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0-Alex</di=
v><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Mon, Jun 25, 2018, 9:20 PM Bjorn Andersson &lt;<a href=3D"mailt=
o:bjorn.andersson@linaro.org">bjorn.andersson@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Mon 25 Jun 18:34 PDT 2018, Alex Eld=
er wrote:<br>
<br>
&gt; From: Bjorn Andersson &lt;<a href=3D"mailto:bjorn.andersson@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">bjorn.andersson@linaro.org</a>&gt;<b=
r>
&gt; <br>
&gt; &quot;start&quot; and &quot;stop&quot; are more suitable names for how=
 these two operations<br>
&gt; are used, and they fit better with the upcoming introduction of two<br=
>
&gt; additional operations in the struct.<br>
&gt; <br>
&gt; [<a href=3D"mailto:elder@linaro.org" target=3D"_blank" rel=3D"noreferr=
er">elder@linaro.org</a>: minor comment edits]<br>
&gt; <br>
&gt; Signed-off-by: Bjorn Andersson &lt;<a href=3D"mailto:bjorn.andersson@l=
inaro.org" target=3D"_blank" rel=3D"noreferrer">bjorn.andersson@linaro.org<=
/a>&gt;<br>
&gt; Acked-by: Alex Elder &lt;<a href=3D"mailto:elder@linaro.org" target=3D=
"_blank" rel=3D"noreferrer">elder@linaro.org</a>&gt;<br>
&gt; Tested-by: Fabien Dessenne &lt;<a href=3D"mailto:fabien.dessenne@st.co=
m" target=3D"_blank" rel=3D"noreferrer">fabien.dessenne@st.com</a>&gt;<br>
<br>
Sorry for not spotting this before, but per section 11 of<br>
Documentation/process/submitting-patches.rst the tag part should read:<br>
<br>
<br>
Tested-by: Fabien Dessenne &lt;<a href=3D"mailto:fabien.dessenne@st.com" ta=
rget=3D"_blank" rel=3D"noreferrer">fabien.dessenne@st.com</a>&gt;<br>
Signed-off-by: Bjorn Andersson &lt;<a href=3D"mailto:bjorn.andersson@linaro=
.org" target=3D"_blank" rel=3D"noreferrer">bjorn.andersson@linaro.org</a>&g=
t;<br>
[<a href=3D"mailto:elder@linaro.org" target=3D"_blank" rel=3D"noreferrer">e=
lder@linaro.org</a>: minor comment edits]<br>
Signed-off-by: Alex Elder &lt;<a href=3D"mailto:elder@linaro.org" target=3D=
"_blank" rel=3D"noreferrer">elder@linaro.org</a>&gt;<br>
<br>
<br>
I.e. as you&#39;re sending the email you must be the last one certifying th=
e<br>
origin of the patch.<br>
<br>
Regards,<br>
Bjorn<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++--------=
------<br>
&gt;=C2=A0 include/linux/remoteproc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 14 ++++++-------<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 22 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc=
/remoteproc_core.c<br>
&gt; index a9609d971f7f..5dd58e6bea88 100644<br>
&gt; --- a/drivers/remoteproc/remoteproc_core.c<br>
&gt; +++ b/drivers/remoteproc/remoteproc_core.c<br>
&gt; @@ -774,13 +774,13 @@ static int rproc_handle_resources(struct rproc *=
rproc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int rproc_probe_subdevices(struct rproc *rproc)<br>
&gt; +static int rproc_start_subdevices(struct rproc *rproc)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rproc_subdev *subdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(subdev, &amp;rproc-&gt;s=
ubdevs, node) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D subdev-&gt;pr=
obe(subdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D subdev-&gt;st=
art(subdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0goto unroll_registration;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -789,17 +789,17 @@ static int rproc_probe_subdevices(struct rproc *=
rproc)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 unroll_registration:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_continue_reverse(subdev,=
 &amp;rproc-&gt;subdevs, node)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdev-&gt;remove(sub=
dev, true);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdev-&gt;stop(subde=
v, true);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void rproc_remove_subdevices(struct rproc *rproc, bool crashed=
)<br>
&gt; +static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rproc_subdev *subdev;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_reverse(subdev, &amp;rpr=
oc-&gt;subdevs, node)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdev-&gt;remove(sub=
dev, crashed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdev-&gt;stop(subde=
v, crashed);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt; @@ -901,8 +901,8 @@ static int rproc_start(struct rproc *rproc, const =
struct firmware *fw)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* probe any subdevices for the remote processor =
*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D rproc_probe_subdevices(rproc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Start any subdevices for the remote processor =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D rproc_start_subdevices(rproc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &qu=
ot;failed to probe subdevices for %s: %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rproc-&gt;name, ret);<br>
&gt; @@ -1014,8 +1014,8 @@ static int rproc_stop(struct rproc *rproc, bool =
crashed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;rproc-&gt;dev;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* remove any subdevices for the remote processor=
 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rproc_remove_subdevices(rproc, crashed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Stop any subdevices for the remote processor *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_stop_subdevices(rproc, crashed);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* the installed resource table is no longer=
 accessible */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rproc-&gt;table_ptr =3D rproc-&gt;cached_tab=
le;<br>
&gt; @@ -1657,16 +1657,16 @@ EXPORT_SYMBOL(rproc_del);<br>
&gt;=C2=A0 =C2=A0* rproc_add_subdev() - add a subdevice to a remoteproc<br>
&gt;=C2=A0 =C2=A0* @rproc: rproc handle to add the subdevice to<br>
&gt;=C2=A0 =C2=A0* @subdev: subdev handle to register<br>
&gt; - * @probe: function to call when the rproc boots<br>
&gt; - * @remove: function to call when the rproc shuts down<br>
&gt; + * @start: function to call after the rproc is started<br>
&gt; + * @stop: function to call before the rproc is stopped<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 void rproc_add_subdev(struct rproc *rproc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct rproc_subdev *subdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int (*probe)(struct rproc_subdev *subdev),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
void (*remove)(struct rproc_subdev *subdev, bool crashed))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int (*start)(struct rproc_subdev *subdev),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
void (*stop)(struct rproc_subdev *subdev, bool crashed))<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0subdev-&gt;probe =3D probe;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0subdev-&gt;remove =3D remove;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0subdev-&gt;start =3D start;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0subdev-&gt;stop =3D stop;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;subdev-&gt;node, &amp;rpr=
oc-&gt;subdevs);<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h<b=
r>
&gt; index dfdaede9139e..bf55bf2a5ee1 100644<br>
&gt; --- a/include/linux/remoteproc.h<br>
&gt; +++ b/include/linux/remoteproc.h<br>
&gt; @@ -477,15 +477,15 @@ struct rproc {<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* struct rproc_subdev - subdevice tied to a remoteproc<br>
&gt;=C2=A0 =C2=A0* @node: list node related to the rproc subdevs list<br>
&gt; - * @probe: probe function, called as the rproc is started<br>
&gt; - * @remove: remove function, called as the rproc is being stopped, th=
e @crashed<br>
&gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0parameter indicates if this originates f=
rom the a recovery<br>
&gt; + * @start: start function, called after the rproc has been started<br=
>
&gt; + * @stop: stop function, called before the rproc is stopped; the @cra=
shed<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0parameter indicates if this originates f=
rom a recovery<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 struct rproc_subdev {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head node;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0int (*probe)(struct rproc_subdev *subdev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0void (*remove)(struct rproc_subdev *subdev, bool =
crashed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*start)(struct rproc_subdev *subdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*stop)(struct rproc_subdev *subdev, bool cr=
ashed);<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* we currently support only two vrings per rvdev */<br>
&gt; @@ -568,8 +568,8 @@ static inline struct rproc *vdev_to_rproc(struct v=
irtio_device *vdev)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void rproc_add_subdev(struct rproc *rproc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct rproc_subdev *subdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int (*probe)(struct rproc_subdev *subdev),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
void (*remove)(struct rproc_subdev *subdev, bool crashed));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int (*start)(struct rproc_subdev *subdev),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
void (*stop)(struct rproc_subdev *subdev, bool crashed));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subde=
v *subdev);<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div>

--000000000000c5d57e056f82c30a--

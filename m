Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 27 Mar 2020 13:36:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2] rpmsg: core: Add wildcard match for name service
Message-ID: <20200327193602.GA22939@xps15>
References: <20200310155058.1607-1-mathieu.poirier@linaro.org>
 <591bd727-32af-9ea2-8c46-98f46ee3711e@ti.com>
 <CANLsYkyv+4cSCY27kA6qfo2XMzXy_h+DmXTe0nVZuUkC0kyRUQ@mail.gmail.com>
 <ca77fe73-3baf-64ff-c9e2-b2f35f96ffe3@ti.com>
 <CANLsYkz8iqiperjdQVcwAC3YGT5cmEvJcu8fPFGF5-X6eKVUDQ@mail.gmail.com>
 <34d1277f-c35e-5df8-7d0c-ea1e961a127f@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34d1277f-c35e-5df8-7d0c-ea1e961a127f@st.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 27, 2020 at 10:35:34AM +0100, Arnaud POULIQUEN wrote:
> Hi
> 
> On 3/26/20 11:01 PM, Mathieu Poirier wrote:
> > On Thu, 26 Mar 2020 at 14:42, Suman Anna <s-anna@ti.com> wrote:
> >>
> >> On 3/26/20 3:21 PM, Mathieu Poirier wrote:
> >>> On Thu, 26 Mar 2020 at 09:06, Suman Anna <s-anna@ti.com> wrote:
> >>>>
> >>>> Hi Mathieu,
> >>>>
> >>>> On 3/10/20 10:50 AM, Mathieu Poirier wrote:
> >>>>> Adding the capability to supplement the base definition published
> >>>>> by an rpmsg_driver with a postfix description so that it is possible
> >>>>> for several entity to use the same service.
> >>>>>
> >>>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >>>>
> >>>> So, the concern I have here is that we are retrofitting this into the
> >>>> existing 32-byte name field, and the question is if it is going to be
> >>>> enough in general. That's the reason I went with the additional 32-byte
> >>>> field with the "rpmsg: add a description field" patch.
> >>>>
> >>>
> >>> That's a valid concern.
> >>>
> >>> Did you consider increasing the size of RPMSG_NAME_SIZE to 64? Have
> >>> you found cases where that wouldn't work?  I did a survey of all the
> >>> places the #define is used and all destination buffers are also using
> >>> the same #define in their definition.  It would also be backward
> >>> compatible with firmware implementations that use 32 byte.
> >>
> >> You can't directly bump the size without breaking the compatibility on
> >> the existing rpmsg_ns_msg in firmwares right? All the Linux-side drivers
> >> will be ok since they use the same macro but rpmsg_ns_msg has presence
> >> on both kernel and firmware-sides.
> > 
> > Ah yes yes... The amount of bytes coming out of the pipe won't match.
> > Let me think a little...
> 
> +1 for Suman's concern.
> 
> Anyway i would like to challenge the need of more than 32 bytes to
> differentiate service instances.
> "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", seems to me enough if we only need
> to differentiate the instances.
> 
> But perhaps the need is also to provide a short description of the service?
> 
> Suman, could you share some examples of your need?

Looking at things further it is possible to extend the name of the service to
64 byte while keeping backward compatibility by looking up the size of @len
in function rpmsg_ns_cb().  From there work with an rpmsg_ns_msg or a new
rpmsg_ns_msg64, pretty much the way you did in your patch[1].  In fact the
approach is the same except you are using 2 arrays of 32 byte and I'm using one
of 64. 

As Arnaud mentioned, is there an immediate need to support a 64-byte name?  If
not than I suggest to move forward with this patch and address the issue when we
get there - at least we know there is room for extention. Otherwise I'll spin
off another revision but it will be bigger and more complex.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/patch/11096599/

> 
> Regards
> Arnaud
>    
> > 
> >>
> >> regards
> >> Suman
> >>
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> regards
> >>>> Suman
> >>>>
> >>>>> ---
> >>>>> Changes for V2:
> >>>>> - Added Arnaud's Acked-by.
> >>>>> - Rebased to latest rproc-next.
> >>>>>
> >>>>>  drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
> >>>>>  1 file changed, 19 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >>>>> index e330ec4dfc33..bfd25978fa35 100644
> >>>>> --- a/drivers/rpmsg/rpmsg_core.c
> >>>>> +++ b/drivers/rpmsg/rpmsg_core.c
> >>>>> @@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
> >>>>>  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >>>>>                                 const struct rpmsg_device_id *id)
> >>>>>  {
> >>>>> -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> >>>>> +     size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
> >>>>> +
> >>>>> +     /*
> >>>>> +      * Allow for wildcard matches.  For example if rpmsg_driver::id_table
> >>>>> +      * is:
> >>>>> +      *
> >>>>> +      * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
> >>>>> +      *      { .name = "rpmsg-client-sample" },
> >>>>> +      *      { },
> >>>>> +      * }
> >>>>> +      *
> >>>>> +      * Then it is possible to support "rpmsg-client-sample*", i.e:
> >>>>> +      *      rpmsg-client-sample
> >>>>> +      *      rpmsg-client-sample_instance0
> >>>>> +      *      rpmsg-client-sample_instance1
> >>>>> +      *      ...
> >>>>> +      *      rpmsg-client-sample_instanceX
> >>>>> +      */
> >>>>> +     return strncmp(id->name, rpdev->id.name, len) == 0;
> >>>>>  }
> >>>>>
> >>>>>  /* match rpmsg channel and rpmsg driver */
> >>>>>
> >>>>
> >>

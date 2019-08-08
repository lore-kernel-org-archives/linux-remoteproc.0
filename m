Date: Thu, 8 Aug 2019 08:37:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/6] hwspinlock: allow sharing of hwspinlocks
Message-ID: <20190808153721.GI26807@tuxbook-pro>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <20190801191403.GA7234@tuxbook-pro>
 <1a057176-81ab-e302-4375-2717ceef6924@st.com>
 <20190805174659.GA23928@tuxbook-pro>
 <dcd1aeea-cffe-d5fb-af5a-e52efcc2e046@ti.com>
 <20190806182128.GD26807@tuxbook-pro>
 <1aea3d28-29dc-f9de-3b86-cf777e0d5caa@ti.com>
 <02329102-5571-c6c1-b78c-693747133f0e@st.com>
 <f0893b3f-0124-007a-3ca2-831f60ad9a80@ti.com>
 <d8d4a172-ec18-a758-d994-8e05bb6a1f48@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8d4a172-ec18-a758-d994-8e05bb6a1f48@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 08 Aug 05:52 PDT 2019, Fabien DESSENNE wrote:

> 
> On 07/08/2019 6:19 PM, Suman Anna wrote:
> > Hi Fabien,
> >
> > On 8/7/19 3:39 AM, Fabien DESSENNE wrote:
> >> Hi
> >>
> >> On 06/08/2019 11:30 PM, Suman Anna wrote:
> >>> On 8/6/19 1:21 PM, Bjorn Andersson wrote:
> >>>> On Tue 06 Aug 10:38 PDT 2019, Suman Anna wrote:
> >>>>
> >>>>> Hi Fabien,
> >>>>>
> >>>>> On 8/5/19 12:46 PM, Bjorn Andersson wrote:
> >>>> I agree that we shouldn't specify this property in DT - if anything it
> >>>> should be a variant of the API.
> >>
> >> If we decide to add a 'shared' API, then, what about the generic regmap
> >> driver?
> >>
> >> In the context of above example1, this would require to update the
> >> regmap driver.
> >>
> >> But would this be acceptable for any driver using syscon/regmap?
> >>
> >>
> >> I think it is better to keep the existing API (modifying it so it always
> >> allows
> >>
> >> hwlocks sharing, so no need for bindings update) than adding another API.
> > For your usecases, you would definitely need the syscon/regmap behavior
> > to be shared right. Whether we introduce a 'shared' API or an
> > 'exclusive' API and change the current API behavior to shared, it is
> > definitely a case-by-case usage scenario for the existing drivers and
> > usage right. The main contention point is what to do with the
> > unprotected usecases like Bjorn originally pointed out.
> 
> OK, I see : the hwspinlock framework does not offer any lock protection 
> with the RAW/IN_ATOMIC modes.
> This is an issue if several different 'local' drivers try to get a 
> shared lock in the same time.
> And this is a personal problem since I need to use shared locks in 
> ...atomic mode.
> 

Why can't you use HWLOCK_IRQSTATE in this mode?

> I have tried to see how it is possible to put a constraint on the 
> callers, just like this is documented for the RAW mode which is:
>  �� "Caution: If the mode is HWLOCK_RAW, that means user must protect 
> the routine
>  ��� of getting hardware lock with mutex or spinlock.."
> I do not think that it is acceptable to ask several drivers to share a 
> common mutex/spinlock for shared locks.

No it's not.

> But I think about another option: the driver implementing the trylock 
> ops may offer such protection. This is the case if the driver returns 
> "busy" if the lock is already taken, not only by the remote processor, 
> but also by the local host.
> 

I think it's typical for hwspinlock hardware to not be able to
distinguish between different clients within Linux, so we would need to
wrap the usage in some construct that ensures mutual exclusion in Linux
- like a spinlock...

> So what do you think about adding such a documentation note :
> "Caution : the HWLOCK_RAW / HWLOCK_IN_ATOMIC modes shall not be used 
> with shared locks unless the hwspinlock driver supports local lock 
> protection"
> 

But having local lock protection in the hwspinlock driver would defeat
the purpose of HWLOCK_RAW.

Also this kind of warning will at best be consumed by the client driver
authors, it will not be read by the dts authors.

Regards,
Bjorn

> Optionally, we may add a "local_lock_protection" flag in the 
> hwspinlock_device struct, set by the driver before it calls 
> hwspin_lock_register().
> This flag can then be checked by hwspinlock core to allow/deny use of 
> shared locks in the raw/atomic modes.
> 
> Let me know what you think about it.
> 
> BR
> 
> Fabien
> 
> >
> > regards
> > Suman
> >
> >>
> >>
> >>>>> If you are sharing a hwlock on the Linux side, surely your driver should
> >>>>> be aware that it is a shared lock. The tag can be set during the first
> >>>>> request API, and you look through both tags when giving out a handle.
> >>>>>
> >>>> Why would the driver need to know about it?
> >>> Just the semantics if we were to support single user vs multiple users
> >>> on Linux-side to even get a handle. Your point is that this may be moot
> >>> since we have protection anyway other than the raw cases. But we need to
> >>> be able to have the same API work across all cases.
> >>>
> >>> So far, it had mostly been that there would be one user on Linux
> >>> competing with other equivalent peer entities on different processors.
> >>> It is not common to have multiple users since these protection schemes
> >>> are usually needed only at the lowest levels of a stack, so the
> >>> exclusive handle stuff had been sufficient.
> >>>
> >>>>> Obviously, the hwspin_lock_request() API usage semantics always had the
> >>>>> implied additional need for communicating the lock id to the other peer
> >>>>> entity, so a realistic usage is most always the specific API variant. I
> >>>>> doubt this API would be of much use for the shared driver usage. This
> >>>>> also implies that the client user does not care about specifying a lock
> >>>>> in DT.
> >>>>>
> >>>> Afaict if the lock are shared then there shouldn't be a problem with
> >>>> some clients using the request API and others request_specific(). As any
> >>>> collisions would simply mean that there are more contention on the lock.
> >>>>
> >>>> With the current exclusive model that is not possible and the success of
> >>>> the request_specific will depend on probe order.
> >>>>
> >>>> But perhaps it should be explicitly prohibited to use both APIs on the
> >>>> same hwspinlock instance?
> >>> Yeah, they are meant to be complimentary usage, though I doubt we will
> >>> ever have any realistic users for the generic API if we haven't had a
> >>> usage so far. I had posted a concept of reserved locks long back [1] to
> >>> keep away certain locks from the generic requestor, but dropped it since
> >>> we did not have an actual use-case needing it.
> >>>
> >>> regards
> >>> Suman
> >>>
> >>> [1] https://lwn.net/Articles/611944/

Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996292641E7
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 May 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829501; cv=none; b=Jwe9wBb6TGk/x25EQllrj03TT8vdKxnr/uvvZaUnylP6fi8JEzbLWXDwXYccU7SOUSeYMRr0GFlO5xnueNz5Jwcupxz51AfqyjxUGM23F/aPNl/VN8vo7cjGW1CdRROVuq93cnHE6ek1D2oykyHAF1hs6w8/SPSCMCEI+tOLUK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829501; c=relaxed/simple;
	bh=VqSxZbHBNqv79Xze1igbciYOMZRnsmnIMjQTjRZltsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRC6DjBSCVxei9k4I4NpphHc+I8EAk65aoIVX0aF7CAH1+ulIdo3A42/7uO7WqxNgiopF/tSSqzO8LzNOVfoAuT48AHi3pvrbSjSBmLcDai1srntJeu8JHQYR3EifNwgc3cbn60/fAuBx0bHkbzEqssTerNFY62zW/gfbpaFYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCcdPsaX; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCcdPsaX"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7b8f7deecaso3129145276.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 May 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747829498; x=1748434298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=leH2Hwtpn8bKj0gxFlEX3tMtghWEWhWZN+JSBgnuZRk=;
        b=gCcdPsaXGcvhRYIGqVy18Jc9wjdi3XtXjSxB18dB2qlAnolXwr4Qde6blLzWz+n3G8
         8B6FpRmVgEcrUn/O7KGDe0Fg3x99hToL3UdqsQOripwzY4CbynwR0l39bGNstu9sc56C
         Od95ROn21oI0tGWHpnIWqtP1u8bZKEKovUS9BsolvIf+n1D2wJDWNiJ58sa5PFwWg5CT
         yPqFIoMvTasX8fZVLabDhttrB91vZjJ3YOMeDO9OpMGkTDtBn++aDB+WkjPimi2a2Lxp
         Qn8Cq7feE3jPhNUXL+KBbDU1Qpp/mQS0Pvwe39xxHdYRM9JHV5vKpoXmWsrR20iV2TeW
         0Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829498; x=1748434298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leH2Hwtpn8bKj0gxFlEX3tMtghWEWhWZN+JSBgnuZRk=;
        b=HiSDPlFqjE3Z0Lo8Xdz1ZUxqbNraZqiKbvbIlV6t9eZ8tyFCH6V8V0gpYE8fMSEhdL
         Jjw+6QI3ceo1U9PhPHYVuSTw4lLUwwq4y6GHyrcquzORwrPRNSTsZN+usCbYOgHHTf3a
         dXriaXb0F3KairmVoTgU1sJnroRejdluTE3y5NdYbPwNLt/FzsPJeyEySKnkRUzSxHEX
         o7N/g+geJU6gEfwun3YM1vLxC8WejEeVvx1ynnQN9LAWB12nx1GQoDRHMTUIcT7kT6yp
         J9vF6XVP6gqbLjfIj/9n0KKK1oSSF7QxUibupZp6KnOb6MSLWaALJbBQNRCh01U9to4/
         6iIw==
X-Forwarded-Encrypted: i=1; AJvYcCUxb+X2qXqnctwpcNUpUAjomXnVYqIVskAsM47TIwitvscVFk4hy+2r5mb7Aen/1CNJEAZhiwSd5oP0+uYsQNMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hO6ucBILFwtKAmUU061I/2nMSJHnPISHGV8S1Z7lc66lmFIg
	ewmZ91kiyancgFnHoyy69lpKsEEHySmNlTEIq0OPn8+Cf4kK4zUv8fbJ0OEZmO63pjqV6jmcjxa
	1uWkoYJM3X60bQJMvJ8lBWb2Q37OIk4yg8geiuLrXRw==
X-Gm-Gg: ASbGnct1GdOBvzoMLruKikVTCN/u9VM4LmPQoHXPFsJM7F0zBlv0T1VeXfVwxchP23K
	tPudDoxJ56z7RcapS/TRQiOVvHXNrJojUalPvcKFjV0v5Olvf6CjgoKTjCtySYkgAxmetqQtbSo
	/ATkMWAxsc8rGbthLOP5xej0k+mvvuMFXm3g==
X-Google-Smtp-Source: AGHT+IFK1U1VhHvGbw7ni7gmxP6cQYNFW+g9T99BOXkJgTIb2HoHmfYe7OdY+kneqLkjitX0ZrvP8e97mCZilZjwnvM=
X-Received: by 2002:a05:6902:228e:b0:e72:85a8:cd14 with SMTP id
 3f1490d57ef6-e7b6d55485fmr25867282276.34.1747829498391; Wed, 21 May 2025
 05:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb> <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux> <20250521041840.GB28017@nxa18884-linux>
In-Reply-To: <20250521041840.GB28017@nxa18884-linux>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 May 2025 14:11:02 +0200
X-Gm-Features: AX0GCFs2ejlkWlTvzumqCZeACImuwbiSBdhWlDwwv02fTo8PCrix65GSFR6kMCo
Message-ID: <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 05:09, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Wed, May 21, 2025 at 12:13:06PM +0800, Peng Fan wrote:
> >Hi Ulf,
> >
> >On Tue, May 20, 2025 at 02:21:49PM +0200, Ulf Hansson wrote:
> >>On Mon, 19 May 2025 at 19:24, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >>>
> >>> Hi Ulf,
> >>>
> >>> On Mon, May 19, 2025 at 04:33:30PM +0200, Ulf Hansson wrote:
> >>> > On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >>> > >
> >>> > > On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> >>> > > > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >>> > > > >
> >>> > > > > Hello,
> >>> > > > >
> >>> > > > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> >>> > > > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >>> > > > > > >
> >>> > > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> >>> > > > > > >
> >>> > > > > > > When the remote core is started before Linux boots (e.g., by the
> >>> > > > > > > bootloader), the driver currently is not able to attach because it only
> >>> > > > > > > checks for cores running in different partitions. If the core was kicked
> >>> > > > > > > by the bootloader, it is in the same partition as Linux and it is
> >>> > > > > > > already up and running.
> >>> > > > > > >
> >>> > > > > > > This adds power mode verification through the SCU interface, enabling
> >>> > > > > > > the driver to detect when the remote core is already running and
> >>> > > > > > > properly attach to it.
> >>> > > > > > >
> >>> > > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >>> > > > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> >>> > > > > > > ---
> >>> > > > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >>> > > > > > > suggested.
> >>> > > > > > > ---
> >>> > > > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> >>> > > > > > >  1 file changed, 13 insertions(+)
> >>> > > > > > >
> >>> > > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >>> > > > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> >>> > > > > > > --- a/drivers/remoteproc/imx_rproc.c
> >>> > > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> >>> > > > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >>> > > > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> >>> > > > > > >                                 return -EINVAL;
> >>> > > > > > >
> >>> > > > > > > +                       /*
> >>> > > > > > > +                        * If remote core is already running (e.g. kicked by
> >>> > > > > > > +                        * the bootloader), attach to it.
> >>> > > > > > > +                        */
> >>> > > > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> >>> > > > > > > +                                                               priv->rsrc_id);
> >>> > > > > > > +                       if (ret < 0)
> >>> > > > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >>> > > > > > > +                                       priv->rsrc_id, ret);
> >>> > > > > > > +
> >>> > > > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> >>> > > > > > > +                               priv->rproc->state = RPROC_DETACHED;
> >>> > > > > > > +
> >>> > > > > > >                         return imx_rproc_attach_pd(priv);
> >>> > > > > >
> >>> > > > > > Why is it important to potentially set "priv->rproc->state =
> >>> > > > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> >>> > > > > >
> >>> > > > > > Would it be possible to do it the other way around? First calling
> >>> > > > > > imx_rproc_attach_pd() then get the power-mode to know if
> >>> > > > > > RPROC_DETACHED should be set or not?
> >>> > > > > >
> >>> > > > > > The main reason why I ask, is because of how we handle the single PM
> >>> > > > > > domain case. In that case, the PM domain has already been attached
> >>> > > > > > (and powered-on) before we reach this point.
> >>> > > > >
> >>> > > > > I am not sure if I understood correcly, let me know if I missed
> >>> > > > > something. From my understanding in this case it does not matter, since
> >>> > > > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> >>> > > > > from rproc_validate(), when rproc_add() is called inside
> >>> > > > > remoteproc_core.c.
> >>> > > >
> >>> > > > Okay, I see.
> >>> > > >
> >>> > > > To me, it sounds like we should introduce a new genpd helper function
> >>> > > > instead. Something along the lines of this (drivers/pmdomain/core.c)
> >>> > > >
> >>> > > > bool dev_pm_genpd_is_on(struct device *dev)
> >>> > > > {
> >>> > > >         struct generic_pm_domain *genpd;
> >>> > > >         bool is_on;
> >>> > > >
> >>> > > >         genpd = dev_to_genpd_safe(dev);
> >>> > > >         if (!genpd)
> >>> > > >                 return false;
> >>> > > >
> >>> > > >         genpd_lock(genpd);
> >>> > > >         is_on = genpd_status_on(genpd);
> >>> > > >         genpd_unlock(genpd);
> >>> > > >
> >>> > > >         return is_on;
> >>> > > > }
> >>> > > >
> >>> > > > After imx_rproc_attach_pd() has run, we have the devices that
> >>> > > > correspond to the genpd(s). Those can then be passed as in-parameters
> >>> > > > to the above function to get the power-state of their PM domains
> >>> > > > (genpds). Based on that, we can decide if priv->rproc->state should be
> >>> > > > to RPROC_DETACHED or not. Right?
> >>> > >
> >>> > > Got your idea, I think it should work yes, I am not so sure how. From
> >>> > > what I can see these power domains are managed by
> >>> > > drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> >>> > > see the power mode is correct when the remote core is powered on:
> >>> > >
> >>> > > [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> >>> > >
> >>> > > and powered off:
> >>> > >
> >>> > > [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> >>> > >
> >>> > > But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> >>> > > proposed. For a quick check, I added this function and it always return
> >>> > > NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> >>> >
> >>> > As your device has multiple PM domains and those gets attached with
> >>> > dev_pm_domain_attach_list(), the device(s) that you should use with
> >>> > dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].
> >>>
> >>> Ok got it, thanks for sharing.
> >>>
> >>> I just send the v3 with the changes Peng proposed (here
> >>> https://lore.kernel.org/lkml/20250519171514.61974-1-hiagofranco@gmail.com/T/#t),
> >>> but I am a bit confused which path we should take, the initial approach
> >>> proposed or using these PD functions. Maybe we can discuss this in the
> >>> new v3 patch series?
> >>
> >>I think it would be better if we can avoid sharing low-level firmware
> >>functions for PM domains. I am worried that they may become abused for
> >>other future use-cases.
> >>
> >>So, if possible, I would rather make us try to use
> >>dev_pm_genpd_is_on() (or something along those lines), but let's see
> >>what Peng thinks about it before we make the decision.
> >
> >There are two power domains for this m4:
> >power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
> >
> >So before attach the pd, dev_pm_genpd_is_on should also return false
> >per my understanding. If run dev_pm_genpd_is_on after attaching the pd,
> >the pd will be powered on. So we are not able to know whether M4 is started
> >by bootloader or not.
>
>
> Could we use PD_FLAG_NO_DEV_LINK when attach the PD, then
> use dev_pm_genpd_is_on to detect the status of genpd?
>
> we set is_off as true when pm_genpd_init if the PD is physical ON.
>

You should not provide any flag (or attach_data to
dev_pm_domain_attach_list()) at all. In other words just call
dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
drivers/remoteproc/imx_dsp_rproc.c does it.

In this way, the device_link is created by making the platform->dev
the consumer and by keeping the supplier-devices (corresponding to the
genpds) in RPM_SUSPENDED state.

The PM domains (genpds) are then left in their current state, which
should allow us to call dev_pm_genpd_is_on() for the corresponding
supplier-devices, to figure out whether the bootloader turned them on
or not, I think.

Moreover, to make sure the genpds are turned on when needed, we also
need to call pm_runtime_enable(platform->dev) and
pm_runtime_get_sync(platform->dev). The easiest approach is probably
to do that during ->probe() - and then as an improvement on top you
may want to implement more fine-grained support for runtime PM.

[...]

Kind regards
Uffe

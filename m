Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF13074A6
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912010; cv=none; b=M+W1bdnUJpJLUjAeteNlRVLJYClYJSOJWRf+a28+iB9UitPhUqx9iZZQtU2uY0Lb4zDQXtSjPxGe3ve+a24B3SIuv/lKM1N2TJ15dvqL3VDjVefU2Iauaia4UxTnCIAbXuiRO2yoIqbUTGQ6OJSlfp+aGc81WLun9NYUAKpkgK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912010; c=relaxed/simple;
	bh=bmTfgdmW6og7l6yx2T+X1zz8jwXLqTDPYKEGjH7odDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmsCYcun5mXm6iV9V0tmk06hn60A4DuF/z+DWqC53fZsVwIkIas9VViDpGTMyCyrKVRaWd1KOlNR5oucFJap0QOhrKBEB8jdC/vpZobb5+Om9aFlmnf4Sihc1vgd0XN2EijlWlC1f91HiHsD/Bq7jLP8w4X2/kCEnikrPLgTZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0SBKD4I; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0SBKD4I"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61d3d622a2bso1402054a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756912007; x=1757516807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wTAdyOlm/H89MIPXpHNMclT4BvrXX7ltwC3KFNrpZs=;
        b=y0SBKD4IfzUc4xX7w88ke66vxK35W7hiWa1O7Z8aMw0jSH69n8FVWMG2X4I70SdKpB
         n4xgT2OgIs0C2ssTIIg0KkHVgZ79dAWm6CABsRmU6yPV6a+xSaOzex0xJltrNyE3JJez
         xK5bhQ7J/muaYIw2q4vz6vsn9+d88aNuYXB7N3JMuiOgZvJ4S9JwNkUvPMuhJob8yzrv
         9CbJCpOECeWlMUgRbT/ip+j9VeRDdcOQIKRxMrjrLlZ1q6WXhoGNpRWmcU+WZ3Z/scUT
         EYwfkeANbPEdqcF7OQOTQSKMPHLCgSCi9NEldQWNa2KlXvV2KV+GEAq6Kfrc/D/LT7Cz
         WGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912007; x=1757516807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wTAdyOlm/H89MIPXpHNMclT4BvrXX7ltwC3KFNrpZs=;
        b=aAwqYNYzWyCUSe7lZJRBppnZkcYUd1qtziTx6nTxDuYQvDHkjobEun8yKcugneKR3E
         effc5zy8t3QwV3psIDVRnCUydruWUlRPeL9WBMCFI5UImn2EN1rJI6iuOLuAtJr8QrE4
         X6ZvjVOis0rWFiyy0hmkrcZuGioDu7hdiuBLD+WR+za/fei8quI0FbDmx5KoCLidzl8l
         rec850W75+dWbJnOQs8oFA2qlWvlW49X0AQH5DwLRmzd81tg4QIdpQJCP4DUuEs7Ne5b
         DARSyvLywavl++nbHyzNHf4FP23MWuCwbi4jbfnMpH2ZG82wX86EQZnPF21tyUKmlaP4
         Qm/A==
X-Forwarded-Encrypted: i=1; AJvYcCW+tGYRiDF7dAJ4iIk7Htj2xKU6DGJyeTMFDv6w9ExGEej+JhFHG5348zhoAVJVPA00CeIpWV29ETXZvPjI+mcP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9bDOF5CZnUh4XlCT8CS0OG8iCvpYryufuuDFHRC8Gx4yujp3
	olpH9BKxwz8IaBJzxLCjhoGE9i9Ty/MHliqQ7fJolYWa8LGCfECaq4VPCosI3C8ma80m9Yw9cjh
	JV0kw9nSFXZ59tZqiA1ZOwVNVxjWspVmfdmHXei5qzIu37wOQeIrJ8OaMow==
X-Gm-Gg: ASbGncsy6AK7ek2vHpWRU2Wf/tIy77aNgfebND+9IlpWeFG1CF4+jhc+Q1yhB7YmVQD
	fUyaJjAwRftqQB7YvF4fVibfcVKsUatsIop6c3fXnGfQTNrkNvywW4W2V69QFgpGNpJ9SvJk2PQ
	mP3dnAIWOwjVu8eAZ4wfHqZ5PM31O9EpNaG/9BtOO4AD/+y64QuI4DHKC4qIiGdYAmzBtRmK840
	3oatM9k16xHU4i755EjWk9B/ldpJGziTjUIlTL+/04N494Vobmv8YFibkRwI0sKJqr/AQQb7Z6p
	44k8Ug==
X-Google-Smtp-Source: AGHT+IF+0pwoAAxX3gf5UWkmV+omghafmOGaLYNyWJBUplkZID7VrCGzVwPUHydMxnaJb7KCcSQuj+InbQ/V0zcvok0=
X-Received: by 2002:a05:6402:3494:b0:61d:9a4c:d03 with SMTP id
 4fb4d7f45d1cf-61d9a4c0e7cmr12317883a12.13.1756912006605; Wed, 03 Sep 2025
 08:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Sep 2025 09:06:34 -0600
X-Gm-Features: Ac12FXxkYEichdIeujGDnw-u0qzphz0riJYUzRCbZ9M50zatPIwa4Kz2wZhsuT4
Message-ID: <CANLsYkw0YqSDC7-SmA4x4hB1Z1kO5MVR-dZb8PAbkw6RMW6PNA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Sept 2025 at 23:28, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:56:11PM +0800, Peng Fan wrote:
> >On Tue, Sep 02, 2025 at 10:38:49AM -0600, Mathieu Poirier wrote:
> >>On Sat, Aug 30, 2025 at 08:52:09PM +0800, Peng Fan wrote:
> >>> On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
> >>> >Good day,
> >>> >
> >>> >On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
> >>> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >>> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >>> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named Syst=
em
> >>> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >>> >> Management(LMM) protocol and CPU protocol and etc.
> >>> >>
> >>> >> There are three cases for M7:
> >>> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control=
 it.
> >>> >>  (2) M7 in a separate Logical Machine that Linux can control it us=
ing
> >>> >>      LMM protocol
> >>> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control =
it
> >>> >>      using CPU protocol
> >>> >>
> >>> >> So extend the driver to using LMM and CPU protocol to manage the M=
7 core.
> >>> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>> >>    has System Manager.
> >>> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(t=
he ID
> >>> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CP=
U
> >>> >>    protocol to start/stop. Otherwise, use LMM protocol to start/st=
op.
> >>> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>> >>    detection could use CPU protocol to detect started or not. So
> >>> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>> >>    status of M7.
> >>> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whe=
ther
> >>> >>    the M7 LM is under control of A55 LM.
> >>> >>
> >>> >> Current setup relies on pre-Linux software(U-Boot) to do
> >>> >> M7 TCM ECC initialization. In future, we could add the support in =
Linux
> >>> >> to decouple U-Boot and Linux.
> >>> >>
> >>> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>> >> ---
> >>> >>  drivers/remoteproc/Kconfig     |   2 +
> >>> >>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++=
++++++++++++-
> >>> >>  drivers/remoteproc/imx_rproc.h |   5 ++
> >>> >>  3 files changed, 127 insertions(+), 3 deletions(-)
> >>> >>
> >>> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconf=
ig
> >>> >> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c=
198ce74d44ce7a9aa206de 100644
> >>> >> --- a/drivers/remoteproc/Kconfig
> >>> >> +++ b/drivers/remoteproc/Kconfig
> >>> >> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
> >>> >>          tristate "i.MX remoteproc support"
> >>> >>          depends on ARCH_MXC
> >>> >>          depends on HAVE_ARM_SMCCC
> >>> >> +        depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> >>> >> +        depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
> >>> >>          select MAILBOX
> >>> >>          help
> >>> >>            Say y here to support iMX's remote processors via the r=
emote
> >>> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/i=
mx_rproc.c
> >>> >> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9d=
f0ed873f493791f2d1466e 100644
> >>> >> --- a/drivers/remoteproc/imx_rproc.c
> >>> >> +++ b/drivers/remoteproc/imx_rproc.c
> >>> >> @@ -8,6 +8,7 @@
> >>> >>  #include <linux/clk.h>
> >>> >>  #include <linux/err.h>
> >>> >>  #include <linux/firmware/imx/sci.h>
> >>> >> +#include <linux/firmware/imx/sm.h>
> >>> >>  #include <linux/interrupt.h>
> >>> >>  #include <linux/kernel.h>
> >>> >>  #include <linux/mailbox_client.h>
> >>> >> @@ -22,6 +23,7 @@
> >>> >>  #include <linux/reboot.h>
> >>> >>  #include <linux/regmap.h>
> >>> >>  #include <linux/remoteproc.h>
> >>> >> +#include <linux/scmi_imx_protocol.h>
> >>> >>  #include <linux/workqueue.h>
> >>> >>
> >>> >>  #include "imx_rproc.h"
> >>> >> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
> >>> >>  #define ATT_CORE_MASK   0xffff
> >>> >>  #define ATT_CORE(I)     BIT((I))
> >>> >>
> >>> >> +/* Logical Machine Operation */
> >>> >> +#define IMX_RPROC_FLAGS_SM_LMM_OP       BIT(0)
> >>> >> +/* Linux has permission to handle the Logical Machine of remote c=
ores */
> >>> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL    BIT(1)
> >>> >> +
> >>> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_b=
lock);
> >>> >>  static void imx_rproc_free_mbox(struct rproc *rproc);
> >>> >>
> >>> >> @@ -116,6 +123,8 @@ struct imx_rproc {
> >>> >>          u32                             entry;          /* cpu st=
art address */
> >>> >>          u32                             core_index;
> >>> >>          struct dev_pm_domain_list       *pd_list;
> >>> >> +        /* For i.MX System Manager based systems */
> >>> >> +        u32                             flags;
> >>> >>  };
> >>> >>
> >>> >>  static const struct imx_rproc_att imx_rproc_att_imx93[] =3D {
> >>> >> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rpro=
c)
> >>> >>          case IMX_RPROC_SCU_API:
> >>> >>                  ret =3D imx_sc_pm_cpu_start(priv->ipc_handle, pri=
v->rsrc_id, true, priv->entry);
> >>> >>                  break;
> >>> >> +        case IMX_RPROC_SM:
> >>> >> +                if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >>> >> +                        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LM=
M_AVAIL))
> >>> >> +                                return -EACCES;
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_lmm_reset_vector_set(dcf=
g->lmid, dcfg->cpuid, 0, 0);
> >>> >> +                        if (ret) {
> >>> >> +                                dev_err(dev, "Failed to set reset=
 vector lmid(%u), cpuid(%u): %d\n",
> >>> >> +                                        dcfg->lmid, dcfg->cpuid, =
ret);
> >>> >> +                        }
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_lmm_operation(dcfg->lmid=
, SCMI_IMX_LMM_BOOT, 0);
> >>> >> +                        if (ret)
> >>> >> +                                dev_err(dev, "Failed to boot lmm(=
%d): %d\n", ret, dcfg->lmid);
> >>> >> +                } else {
> >>> >> +                        ret =3D scmi_imx_cpu_reset_vector_set(dcf=
g->cpuid, 0, true, false, false);
> >>> >> +                        if (ret) {
> >>> >> +                                dev_err(dev, "Failed to set reset=
 vector cpuid(%u): %d\n",
> >>> >> +                                        dcfg->cpuid, ret);
> >>> >> +                        }
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_cpu_start(dcfg->cpuid, t=
rue);
> >>> >> +                }
> >>> >> +                break;
> >>> >>          default:
> >>> >>                  return -EOPNOTSUPP;
> >>> >>          }
> >>> >> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc=
)
> >>> >>          case IMX_RPROC_SCU_API:
> >>> >>                  ret =3D imx_sc_pm_cpu_start(priv->ipc_handle, pri=
v->rsrc_id, false, priv->entry);
> >>> >>                  break;
> >>> >> +        case IMX_RPROC_SM:
> >>> >> +                if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >>> >> +                        if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_=
AVAIL)
> >>> >> +                                ret =3D scmi_imx_lmm_operation(dc=
fg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >>> >> +                        else
> >>> >> +                                ret =3D -EACCES;
> >>> >> +                } else {
> >>> >> +                        ret =3D scmi_imx_cpu_start(dcfg->cpuid, f=
alse);
> >>> >> +                }
> >>> >> +                break;
> >>> >>          default:
> >>> >>                  return -EOPNOTSUPP;
> >>> >>          }
> >>> >> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rpro=
c *rproc,
> >>> >>          return 0;
> >>> >>  }
> >>> >>
> >>> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >>> >> +{
> >>> >> +        struct imx_rproc *priv =3D rproc->priv;
> >>> >> +        const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >>> >> +        int ret;
> >>> >> +
> >>> >> +        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >>> >> +                return 0;
> >>> >> +
> >>> >> +        /*
> >>> >> +         * Power on the Logical Machine to make sure TCM is avail=
able.
> >>> >> +         * Also serve as permission check. If in different Logica=
l
> >>> >> +         * Machine, and linux has permission to handle the Logica=
l
> >>> >> +         * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >>> >> +         */
> >>> >> +        ret =3D scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_P=
OWER_ON, 0);
> >>> >> +        if (ret =3D=3D 0) {
> >>> >> +                dev_info(priv->dev, "lmm(%d) powered on\n", dcfg-=
>lmid);
> >>> >> +                priv->flags |=3D IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >>> >
> >>> >Why is setting this flag needed?  The check that is done on it in
> >>> >imx_rproc_{start|stop} should be done here.  If there is an error th=
en we don't
> >>> >move forward.
> >>>
> >>> The flag is to indicate M7 LM could be controlled by Linux LM(to save=
 SCMI
> >>> calls. without this flag, heavy SCMI calls will be runs into). The re=
ason
> >>> on why set it here:
> >>> The prepare function will be invoked in two path: rproc_attach and rp=
roc_fw_boot.
> >>> When M7 LM works in detached state and not under control of Linux LM,=
 rproc_stop
> >>> could still be invoked, so we need to avoid Linux runs into scmi call=
s to
> >>> stop M7 LM(even if scmi firmware will return -EACCESS, but with a fla=
g, we could
> >>> save a SCMI call), so there is a check in imx_rproc_stop and this is =
why
> >>> we need a flag there.
> >>>
> >>> The flag check in start might be redundant, but to keep safe, I still=
 keep
> >>> it there.
> >>
> >>One of the (many) problem I see with this patch is that there is no
> >>IMX_RPROC_FLAGS_SM_CPU_OP to complement IMX_RPROC_FLAGS_SM_LMM_OP in
> >>imx_rproc_detect_mode(), leading to if/else statements that are hard to=
 follow.
> >
> >There are only two methods as written in commit log.
> >one is LMM_OP, the other is CPU_OP
> >
> >>
> >>In imx_rproc_sm_lmm_prepare(), if scmi_imx_lmm_operation() is successfu=
l, return
> >>0 immediately.  If -EACCESS the LMM method is unavailable in both norma=
l and
> >>detached mode, so priv->flags &=3D ~IMX_RPROC_FLAGS_SM_LMM_OP.
> >
> >No. LMM in avaiable in normal and detach mode. I have written in commit =
log,
> >There are three cases for M7:
> > (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> > (2) M7 in a separate Logical Machine that Linux can control it using
> >     LMM protocol
> > (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >     using CPU protocol
> >
> >>
> >>The main takeaway here is that the code introduced by this patch is dif=
ficult to
> >>understand and maintain.  I suggest you find a way to make things simpl=
er.
> >
> >You asked Daniel to help review this patchset. Daniel and Frank both hel=
p
> >reviewed this patchset and gave R-b.
> >
> >You also said this patchset "looks fine to you" Jul 21 [1].
> >
> >Now you overturn these and say "find a way to make things simpler.
> >What's the point to ask my colleague to review?  What should I do,
> >redesign the patchset according to "make things simpler"?
> >
> >Please give detailed suggestions, but not a general comment.
>
> I realize my previous message may have come across as frustrated =E2=80=
=94 I truly
> appreciate your time and feedback. I=E2=80=99m just trying to understand =
the
> direction you=E2=80=99d prefer for this patchset, especially since it had=
 prior
> R-b=E2=80=99s and your earlier comment that it =E2=80=9Clooks fine.=E2=80=
=9D
>

I simply started taking a closer look and quickly found problems.

> Could you please help clarify what specifically you=E2=80=99d like simpli=
fied?
> I=E2=80=99m happy to revise accordingly, but I=E2=80=99d really appreciat=
e concrete
> suggestions so I can move forward effectively.
>

I did give suggestions.  The core of this patch is 123 lines - even
after spending two full hours reviewing it I still don't have a clear
picture of what is happening.  When that is the case, something is not
right.  When I look at a patchset, I usually ask myself if I'll
remember what it does when looking at it again in 6 months.  The
answer was a clear "no" with this one.

> @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset, =
do you
> have thoughts on the latest feedback from Mathieu? Would you agree that
> further simplification is needed, or is the current structure acceptable?=
=E2=80=9D
>
> Thanks again!
>
> Thanks,
> Peng
>
> >
> >[1] https://lore.kernel.org/all/CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=3Dytmu=
2q90NyEpkoX9g@mail.gmail.com/
> >
> >Thanks,
> >Peng
> >>
> >

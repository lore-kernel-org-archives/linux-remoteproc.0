Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271658;
	b=4oMvIoktnlD6SzHInnuOWwPWJrOwSP9ecxZ9XLLyBhef+aU+ojIyMTRvwUbnHSMSLpjF
	 D8jP+1RyqHorgS4ZDJZ+3G1IYf9gHwlxsPrl7u9SxP6PYWoWfJSgiK59NEi/7SQhsV45w
	 OxYiR5YnFBGQim8nOWriiPnJjPEc40Z1HlVM67YpKfB4E3QKJwpclA5blR+sDGHSo878D
	 WG11teSC99YW6LTFtfw/eymET1i1Fi58N1TxrwneBvrquvYqIpZSwm9teOIi4fkM6cUzk
	 RF2kT2OhfNWFHKAuIA0ssKCIJ2nH8ODMAS3n+FvJThHF7AbxAZ+mbV8P75uuy/HTPZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XT/3h5E5em4pYHsIle1YLOKe3Qi8EjiUcfgpkNj2N+k=;
	b=ddCCc4SmL+pUhlfiRwxl0ctjNKA+m0gZwHcn6KiOUsav5z1NoWIbYBXcxteo9XGku4FQ
	 xYLZOQDgzwBHMbckORZiN6GGa2v1DUq6tI5QcaY/+NgMeE/SFL2O3RzmBFpzRhxe5hgKC
	 VLvco33fvf/bEpYCtnq/o2U3Gm1wAOu7yuQckRPDuUXnXR8L8w7W6d9XAP+lJK6w/MTTe
	 iA/RFFC9GkYign0MNnctiVdyAXI/q2/NTubXXJzFmQl87GgcPNwhrq1qgiyKyc1tZ7Dai
	 DoRJ2ly8WWPi5dhJENaB1GW60ocktY3Kx+YHfp5V7Q1MmO6UYfpuIAU2cfcTp1nhI9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ch+WDuNA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615E606A31C
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 11:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3615E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ch+WDuNA
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so1509070b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 04:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793271656; cv=none;
        d=google.com; s=arc-20260327;
        b=sfhG7jQfb49FxJl/l91mzOt//z+duySaN120qDBKhgSgQHDLUqF/1vw5i3PlP/O2pi
         P4IK1jqhuW8pRw7km99IrpsEbbdVhhf59QdtYNGwfserKk+7fvTuLH055JdnGL3hj0Vk
         lUWuFdwN3YF+Czn7QC+DnQ5ppcS6nFJWmf2eZkNcgZx0xZkCJlowdabbWs7sCDx/0b3P
         /hupipIRUzbei6YMHGgJDCUzYvo/XyFzUBcVdi9ZlXW+JeprPzeXSKquSQC9Ab7q3KX+
         TOdTfl5N1OapMMKsJVYkm/Iqw4svWtU9hrRpyVtZJ4/6JLMkLIH5joYoPSQ0zWgbId/4
         fMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT/3h5E5em4pYHsIle1YLOKe3Qi8EjiUcfgpkNj2N+k=;
        fh=rpU/dDzVplXa9U+88yPVZZzqNEUF9Kus0ykKeIfp078=;
        b=fu2a+t8xhxGecMEKf6oa1j//h3hgGSufwYHXjvmcPLrnZQEriCEH0k0qmPSaMbocJc
         ZI0dSNwXb77OPWjtz3CEF6M1aGCzRw8EBqS9pplAAKTU5aqCDjJ43ruO3OGg1I8BzKAd
         gdMXYPBVv6YkAQIEOs6eFNbAuoYxdrzIpoUcoKf66dTIW5EKjJRzzdRxCv0u6JWX56TP
         mGb6mWnMB2O3F+EA49SP6UckHKRW6ghOWMgiXD73V4F7a9PYTca5mXi/LhKYXB6oLiFr
         zAms+K7krXh/23AgGgwX86bbfIUVk5ZGJhwTmQ35OI7Wqi3rfZgHJmROGG9ntA3WSRpd
         SBiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271656; x=1793876456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XT/3h5E5em4pYHsIle1YLOKe3Qi8EjiUcfgpkNj2N+k=;
        b=Ch+WDuNAYuyWMZLcrA+ZG7T9KH8RQnO2AfU8ik9c7MMRqSdmKdoWArtuYRtGB/9ugR
         RDyoE7f0K3JhmWnfBeBR9HjM/eCnhx+Pg1UU1xPT/xrSYsFH8x4YgSBv4WUzqhk8og/e
         C2q0TdYeVgGdtrlPEj7CwHTIQsAP1N34OA5uxN3LBMYzUUwuLjBXjqaWDqZqeNrEVpyU
         4OYxwTaxxsWCQ0bygw9ERUAG/6XN/+WKc0H6PQmyuRU0MUI+VEEuTZl8Ur6kIfFPxUHw
         qymTkx5sL/a4QdeAUltZXoYiKlWnJzodctgYxDBMm0iLInux0lHLzNm/xUKriIb3yCgA
         EWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271656; x=1793876456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XT/3h5E5em4pYHsIle1YLOKe3Qi8EjiUcfgpkNj2N+k=;
        b=mN0KJJqKdabo37RT6wmhtqy2lzoyXjdCsHKWOPZgo+FlTRWq3C2oyX0+Z5G9FMeBcv
         oM0tHlSP6iSi2HNTK5zoiHUDlepRlG2NBmx23ll0aWbiKdfQ2V4CoHXnLTgm2AXRrbUq
         zMAcQSz5FY8x306pLSGm/PfnCe7vwBDz4nkR3Tg5kFgaLFW9vFCroDzyY5JOjky5B0fK
         gW9MpAxK11p51I4vv5tfc6znUNO3keccdZxrx7WbE8JE8wQmDYe2/laMfr3c1iHRw+o3
         nC/V6j8DxlPIGCT+P3m7060L3vruSzwr60Yyaj1v88mAA4EbF4Hv2yF8vl/Mjlfd/D6x
         uaAw==
X-Forwarded-Encrypted: i=1; AKwUvBzEb0zWtIOarM+Kwq1J5I1MGJ/pCW7Yjh25llHvsr5MxCzagKyKaCoW6ZVhCdyIBSFSBlVsTI42sq8U5ArF4vUG@vger.kernel.org
X-Gm-Message-State: AFq9FYK7GtL7joQAs7NtIaGd2bAkIzZWkLXZShJaOOUzLkuRmH6dyZMA
	dSj0tQfOGodVdPs/BoKSnKX3wyG6CsU2lWK3B2fDni1GddbGlH2bc0DO1owJme0DVsk9Uo+MBr8
	Yw94FvFKJTNnaqRlOtYHSJ4LWbNpu9Nk=
X-Gm-Gg: AYBFou0eGLcv45eXCWd9v+MAoDfE5NWYsN5lGsGWW21vrUGJZuzREx72FTJGvNLIccF
	RYDhsGumjGQbj7lvZsIaXAju/pj3eGjJ3cc39FLWXyYA+D45Y6fFLzHM7bCBjRm10+ZoDAIVaOh
	yZrVs2tZpfHmv3kFYVJ8sUJe5RBwxnQHTpUtym5a9C6jTpIV/WJz9L2E8pDYAwA7UH8PKElJ55R
	EcZvAxr3R+zpXaLkS9w2vRLHudizp5eFQRXH+/qOcmEGJn4RcPsG839CZ1pUy2Dl4Rt0i0WePBN
	RjVtdulOaoZOUZ5BwCTVZzHro/zYVdDn0C9PDbzoUWKFPknNc7c+BhQmeytbvHa5w/KR97QhP+F
	ob7RY40ZgI07Wg/oWFsl1F6t5fTTZFfb6Ew4V9g==
X-Received: by 2002:a05:6a00:8007:b0:88c:e59e:e168 with SMTP id
 d2e1a72fcca58-8a6e83aa869mr4259884b3a.52.1793271656146; Thu, 29 Oct 2026
 04:00:56 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com> <20261014103241.3847-3-sid9.karanam@gmail.com>
 <d18e3659-e001-4f44-92ce-c7e3c1660263@ti.com> <CABM86px_9=4sHAqCm6wEhRsaT7zwxyitN6ewmjQa7ODzqk-qtg@mail.gmail.com>
 <76ae6bad-648b-4e49-bb8a-7ba1fc1a40fe@ti.com>
In-Reply-To: <76ae6bad-648b-4e49-bb8a-7ba1fc1a40fe@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Thu, 29 Oct 2026 16:30:43 +0530
X-Gm-Features: AclHuK8GTHwpKolMgzFte-iXpVV0W0WJb9YSWXe1ynZ4ozg2XSYnYuS7YmDoNaU
Message-ID: <CABM86pyCt6kQ30kj4EhGFj1JLYDOBw8_MsDzfppLQPL0uEHAcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Yes this information is good to mention in cover-letter and
> diffstat section of patches. But you have mentioned it in the commit
> message of the patch which lives forever in the tree after merge.
> Cover-letters and texts in diffstat section are not merged into tree
> and are just archived in lore if you want to get back to it someday.

Oh right so I don't need to mention the "original thread" related text
in the commit message right (just the cover letter)?

Thanks,
Siddharth

On Thu, Oct 29, 2026 at 4:16=E2=80=AFPM Beleswar Prasad Padhi <b-padhi@ti.c=
om> wrote:
>
>
> On 29/10/26 15:54, Sidd wrote:
> >> You can put this changelog in diffstat. We may not need this info in
> >> commit message.
> > I have mentioned what v1 was about and the changes this brings as
> > Andrew told me to do so (I had unfortunately replied only to him so I
> > think other members were not able to view that, so he recommended that
> > I mention that in the cover letter).
>
>
> Yes this information is good to mention in cover-letter and
> diffstat section of patches. But you have mentioned it in the commit
> message of the patch which lives forever in the tree after merge.
> Cover-letters and texts in diffstat section are not merged into tree
> and are just archived in lore if you want to get back to it someday.
>
> Example of changelog in cover-letter:
> https://lore.kernel.org/all/20260930200158.174118-1-b-padhi@ti.com/
>
> Example of changelog in patch diffstat:
> https://lore.kernel.org/all/20260930200158.174118-3-b-padhi@ti.com/
>
> Thanks,
> Beleswar
>
> >
> >> Since a RFC is posted, you can drop this part of the text and just
> >> mention we could switch to pm runtime calls in the future.
> > Sure thing.
> >
> >> Here and everywhere else, can you add an empty line before return
> >> statement? No hard and fast rule, but this has been followed
> >> throughout the existing TI remoteproc drivers.
> > No problem, I'll fix those issues.
> >
> > Thanks,
> > Siddharth
> >
> > On Thu, Oct 29, 2026 at 2:03=E2=80=AFPM Padhi, Beleswar <b-padhi@ti.com=
> wrote:
> >> Hi Siddharth,
> >>
> >> On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> >>> The previous version of the patch had a new header ti_sci_dev.h,
> >>> that mirrors ti_sci_proc.h in terms of the struct decl and
> >>> its helper function structure, with the goal of abstracting
> >>> all ti_sci_handle's members like ti_sci_dev_ops from being
> >>> invoked directly in the driver code.
> >>>
> >>> Upon discussing in the original patch thread, it seemed
> >>> better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> >>> and merge all their helpers into a single header. That is
> >>> what ti_sci_ctrl.h aims to do: It has the union of tsd
> >>> (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> >>> functions are prefixed with ti_sci_ctrl_dev and
> >>> ti_sci_ctrl_proc respectively.
> >>
> >> You can put this changelog in diffstat. We may not need this info in
> >> commit message.
> >>
> >>> The goal of the patch is to maintain a single source
> >>> of origin for all ti_sci_dev/proc_ops call sites. Any stray calls
> >>> to dev_ops/proc_ops function pointer members in driver code should
> >>> eventually be abstracted through this header.
> >>>
> >>> In the future we can try to abstract tsd's dev_ops even further
> >>> through pm_runtime, but there are some roadblocks that
> >>
> >> Since a RFC is posted, you can drop this part of the text and just
> >> mention we could switch to pm runtime calls in the future.
> >>
> >>> I am unaware of, so that warranties a different patch.
> >>>
> >>> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> >>> ---
> >>>   drivers/remoteproc/ti_k3_common.c         |  17 +--
> >>>   drivers/remoteproc/ti_k3_common.h         |   6 +-
> >>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
> >>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  24 ++-
> >>>   drivers/remoteproc/ti_k3_r5_remoteproc.c  |  58 +++----
> >>>   drivers/remoteproc/ti_sci_ctrl.h          | 177 +++++++++++++++++++=
+++
> >>>   drivers/remoteproc/ti_sci_dev.h           |  82 ----------
> >>>   drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
> >>>   8 files changed, 231 insertions(+), 289 deletions(-)
> >>>   create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
> >>>   delete mode 100644 drivers/remoteproc/ti_sci_dev.h
> >>>   delete mode 100644 drivers/remoteproc/ti_sci_proc.h
> >>>
> >>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/t=
i_k3_common.c
> >>> index befa9a9bea3a..f778ae545bde 100644
> >>> --- a/drivers/remoteproc/ti_k3_common.c
> >>> +++ b/drivers/remoteproc/ti_k3_common.c
> >>> @@ -32,8 +32,7 @@
> >>>
> >>>   #include "omap_remoteproc.h"
> >>>   #include "remoteproc_internal.h"
> >>> -#include "ti_sci_dev.h"
> >>> -#include "ti_sci_proc.h"
> >>> +#include "ti_sci_ctrl.h"
> >>>   #include "ti_k3_common.h"
> >>>
> >>>   /**
> >>> @@ -121,7 +120,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> >>>               if (ret)
> >>>                       dev_err(dev, "local-reset assert failed (%pe)\n=
", ERR_PTR(ret));
> >>>       } else {
> >>> -             ret =3D ti_sci_dev_put_device(kproc->tsd);
> >>> +             ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >>>               if (ret)
> >>>                       dev_err(dev, "module-reset assert failed (%pe)\=
n", ERR_PTR(ret));
> >>>       }
> >>> @@ -140,11 +139,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
> >>>               ret =3D reset_control_deassert(kproc->reset);
> >>>               if (ret) {
> >>>                       dev_err(dev, "local-reset deassert failed, (%pe=
)\n", ERR_PTR(ret));
> >>> -                     if (ti_sci_dev_put_device(kproc->tsd))
> >>> +                     if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >>>                               dev_warn(dev, "module-reset assert back=
 failed\n");
> >>>               }
> >>>       } else {
> >>> -             ret =3D ti_sci_dev_get_device(kproc->tsd);
> >>> +             ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >>>               if (ret)
> >>>                       dev_err(dev, "module-reset deassert failed (%pe=
)\n", ERR_PTR(ret));
> >>>       }
> >>> @@ -221,7 +220,7 @@ int k3_rproc_prepare(struct rproc *rproc)
> >>>               }
> >>>       }
> >>>
> >>> -     ret =3D ti_sci_dev_get_device(kproc->tsd);
> >>> +     ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >>>       if (ret) {
> >>>               dev_err(dev, "could not deassert module-reset for inter=
nal RAM loading\n");
> >>>               return ret;
> >>> @@ -250,7 +249,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
> >>>       if (rproc->state =3D=3D RPROC_DETACHED)
> >>>               return 0;
> >>>
> >>> -     ret =3D ti_sci_dev_put_device(kproc->tsd);
> >>> +     ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >>>       if (ret) {
> >>>               dev_err(dev, "module-reset assert failed\n");
> >>>               return ret;
> >>> @@ -528,9 +527,9 @@ EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
> >>>
> >>>   void k3_release_tsp(void *data)
> >>
> >> Function needs to be renamed.
> >>
> >>>   {
> >>> -     struct ti_sci_proc *tsp =3D data;
> >>> +     struct ti_sci_ctrl *tsc =3D data;
> >>>
> >>> -     ti_sci_proc_release(tsp);
> >>> +     ti_sci_ctrl_proc_release(tsc);
> >>>   }
> >>>   EXPORT_SYMBOL_GPL(k3_release_tsp);
> >>>
> >>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/t=
i_k3_common.h
> >>> index 7ba0903ebe0a..f4b9bb0fa0f0 100644
> >>> --- a/drivers/remoteproc/ti_k3_common.h
> >>> +++ b/drivers/remoteproc/ti_k3_common.h
> >>> @@ -71,8 +71,7 @@ struct k3_rproc_dev_data {
> >>>    * @num_rmems: number of reserved memory regions
> >>>    * @reset: reset control handle
> >>>    * @data: pointer to DSP-specific device data
> >>> - * @tsp: TI-SCI processor control handle
> >>> - * @tsd: TI-SCI device control handle
> >>> + * @tsc: TI-SCI control handle
> >>>    * @ti_sci: TI-SCI handle
> >>>    * @mbox: mailbox channel handle
> >>>    * @client: mailbox client to request the mailbox channel
> >>> @@ -87,8 +86,7 @@ struct k3_rproc {
> >>>       int num_rmems;
> >>>       struct reset_control *reset;
> >>>       const struct k3_rproc_dev_data *data;
> >>> -     struct ti_sci_proc *tsp;
> >>> -     struct ti_sci_dev *tsd;
> >>> +     struct ti_sci_ctrl *tsc;
> >>>       const struct ti_sci_handle *ti_sci;
> >>>       struct mbox_chan *mbox;
> >>>       struct mbox_client client;
> >>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remo=
teproc/ti_k3_dsp_remoteproc.c
> >>> index b6042fe7bae7..6cbf21c82e85 100644
> >>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >>> @@ -19,8 +19,7 @@
> >>>
> >>>   #include "omap_remoteproc.h"
> >>>   #include "remoteproc_internal.h"
> >>> -#include "ti_sci_dev.h"
> >>> -#include "ti_sci_proc.h"
> >>> +#include "ti_sci_ctrl.h"
> >>>   #include "ti_k3_common.h"
> >>>
> >>>   /*
> >>> @@ -45,7 +44,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
> >>>       }
> >>>
> >>>       dev_dbg(dev, "booting DSP core using boot addr =3D 0x%x\n", boo=
t_addr);
> >>> -     ret =3D ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
> >>> +     ret =3D ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0=
);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> @@ -115,22 +114,17 @@ static int k3_dsp_rproc_probe(struct platform_d=
evice *pdev)
> >>>               return dev_err_probe(dev, PTR_ERR(kproc->reset),
> >>>                                    "failed to get reset\n");
> >>>
> >>> -     kproc->tsp =3D ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
> >>> -     if (IS_ERR(kproc->tsp))
> >>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
> >>> -                                  "failed to construct ti-sci proc c=
ontrol\n");
> >>> +     kproc->tsc =3D ti_sci_ctrl_of_get(dev, kproc->ti_sci);
> >>> +     if (IS_ERR(kproc->tsc))
> >>> +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
> >>> +                                  "failed to get construct ti-sci co=
ntrol\n");
> >>>
> >>> -     kproc->tsd =3D ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> >>> -     if (IS_ERR(kproc->tsd))
> >>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> >>> -                                  "failed to construct ti-sci dev co=
ntrol\n");
> >>> -
> >>> -     ret =3D ti_sci_proc_request(kproc->tsp);
> >>> +     ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >>>       if (ret < 0) {
> >>> -             dev_err_probe(dev, ret, "ti_sci_proc_request failed\n")=
;
> >>> +             dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request faile=
d\n");
> >>>               return ret;
> >>>       }
> >>> -     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->ts=
p);
> >>> +     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->ts=
c);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> @@ -142,7 +136,7 @@ static int k3_dsp_rproc_probe(struct platform_dev=
ice *pdev)
> >>>       if (ret)
> >>>               return dev_err_probe(dev, ret, "reserved memory init fa=
iled\n");
> >>>
> >>> -     ret =3D ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
> >>> +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, NULL, &p_state);
> >>>       if (ret)
> >>>               return dev_err_probe(dev, ret, "failed to get initial s=
tate, mode cannot be determined\n");
> >>>
> >>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remot=
eproc/ti_k3_m4_remoteproc.c
> >>> index ddf8cb9974ca..9c789a92d083 100644
> >>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> >>> @@ -18,8 +18,7 @@
> >>>
> >>>   #include "omap_remoteproc.h"
> >>>   #include "remoteproc_internal.h"
> >>> -#include "ti_sci_dev.h"
> >>> -#include "ti_sci_proc.h"
> >>> +#include "ti_sci_ctrl.h"
> >>>   #include "ti_k3_common.h"
> >>>
> >>>   static const struct rproc_ops k3_m4_rproc_ops =3D {
> >>> @@ -75,20 +74,15 @@ static int k3_m4_rproc_probe(struct platform_devi=
ce *pdev)
> >>>       if (IS_ERR(kproc->reset))
> >>>               return dev_err_probe(dev, PTR_ERR(kproc->reset), "faile=
d to get reset\n");
> >>>
> >>> -     kproc->tsp =3D ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
> >>> -     if (IS_ERR(kproc->tsp))
> >>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
> >>> -                                  "failed to construct ti-sci proc c=
ontrol\n");
> >>> +     kproc->tsc =3D ti_sci_ctrl_of_get(dev, kproc->ti_sci);
> >>> +     if (IS_ERR(kproc->tsc))
> >>> +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
> >>> +                                  "failed to construct ti-sci contro=
l\n");
> >>>
> >>> -     kproc->tsd =3D ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> >>> -     if (IS_ERR(kproc->tsd))
> >>> -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> >>> -                                  "failed to construct ti-sci dev co=
ntrol\n");
> >>> -
> >>> -     ret =3D ti_sci_proc_request(kproc->tsp);
> >>> +     ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >>>       if (ret < 0)
> >>> -             return dev_err_probe(dev, ret, "ti_sci_proc_request fai=
led\n");
> >>> -     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->ts=
p);
> >>> +             return dev_err_probe(dev, ret, "ti_sci_ctrl_proc_reques=
t failed\n");
> >>> +     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->ts=
c);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> @@ -100,7 +94,7 @@ static int k3_m4_rproc_probe(struct platform_devic=
e *pdev)
> >>>       if (ret)
> >>>               return dev_err_probe(dev, ret, "reserved memory init fa=
iled\n");
> >>>
> >>> -     ret =3D ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
> >>> +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &p_state);
> >>>       if (ret)
> >>>               return dev_err_probe(dev, ret,
> >>>                                    "failed to get initial state, mode=
 cannot be determined\n");
> >>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remot=
eproc/ti_k3_r5_remoteproc.c
> >>> index a387848ac400..caeeb18581d0 100644
> >>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> >>> @@ -25,8 +25,7 @@
> >>>
> >>>   #include "omap_remoteproc.h"
> >>>   #include "remoteproc_internal.h"
> >>> -#include "ti_sci_dev.h"
> >>> -#include "ti_sci_proc.h"
> >>> +#include "ti_sci_ctrl.h"
> >>>   #include "ti_k3_common.h"
> >>>
> >>>   /* This address can either be for ATCM or BTCM with the other at ad=
dress 0x0 */
> >>> @@ -141,7 +140,7 @@ static int k3_r5_split_reset(struct k3_rproc *kpr=
oc)
> >>>               return ret;
> >>>       }
> >>>
> >>> -     ret =3D ti_sci_dev_put_device(kproc->tsd);
> >>> +     ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >>>       if (ret) {
> >>>               dev_err(kproc->dev, "module-reset assert failed, ret =
=3D %d\n",
> >>>                       ret);
> >>> @@ -156,7 +155,7 @@ static int k3_r5_split_release(struct k3_rproc *k=
proc)
> >>>   {
> >>>       int ret;
> >>>
> >>> -     ret =3D ti_sci_dev_get_device(kproc->tsd);
> >>> +     ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >>>       if (ret) {
> >>>               dev_err(kproc->dev, "module-reset deassert failed, ret =
=3D %d\n",
> >>>                       ret);
> >>> @@ -167,7 +166,7 @@ static int k3_r5_split_release(struct k3_rproc *k=
proc)
> >>>       if (ret) {
> >>>               dev_err(kproc->dev, "local-reset deassert failed, ret =
=3D %d\n",
> >>>                       ret);
> >>> -             if (ti_sci_dev_put_device(kproc->tsd))
> >>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >>>                       dev_warn(kproc->dev, "module-reset assert back =
failed\n");
> >>>       }
> >>>
> >>> @@ -194,7 +193,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_clus=
ter *cluster)
> >>>       /* disable PSC modules on all applicable cores */
> >>>       list_for_each_entry(core, &cluster->cores, elem) {
> >>>               kproc =3D core->kproc;
> >>> -             ret =3D ti_sci_dev_put_device(kproc->tsd);
> >>> +             ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >>>               if (ret) {
> >>>                       dev_err(core->dev, "module-reset assert failed,=
 ret =3D %d\n",
> >>>                               ret);
> >>> @@ -207,7 +206,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_clus=
ter *cluster)
> >>>   unroll_module_reset:
> >>>       list_for_each_entry_continue_reverse(core, &cluster->cores, ele=
m) {
> >>>               kproc =3D core->kproc;
> >>> -             if (ti_sci_dev_put_device(kproc->tsd))
> >>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >>>                       dev_warn(core->dev, "module-reset assert back f=
ailed\n");
> >>>       }
> >>>       core =3D list_last_entry(&cluster->cores, struct k3_r5_core, el=
em);
> >>> @@ -229,7 +228,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cl=
uster *cluster)
> >>>       /* enable PSC modules on all applicable cores */
> >>>       list_for_each_entry_reverse(core, &cluster->cores, elem) {
> >>>               kproc =3D core->kproc;
> >>> -             ret =3D ti_sci_dev_get_device(kproc->tsd);
> >>> +             ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >>>               if (ret) {
> >>>                       dev_err(core->dev, "module-reset deassert faile=
d, ret =3D %d\n",
> >>>                               ret);
> >>> @@ -259,7 +258,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cl=
uster *cluster)
> >>>   unroll_module_reset:
> >>>       list_for_each_entry_from(core, &cluster->cores, elem) {
> >>>               kproc =3D core->kproc;
> >>> -             if (ti_sci_dev_put_device(kproc->tsd))
> >>> +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >>>                       dev_warn(core->dev, "module-reset assert back f=
ailed\n");
> >>>       }
> >>>
> >>> @@ -268,13 +267,13 @@ static int k3_r5_lockstep_release(struct k3_r5_=
cluster *cluster)
> >>>
> >>>   static inline int k3_r5_core_halt(struct k3_rproc *kproc)
> >>>   {
> >>> -     return ti_sci_proc_set_control(kproc->tsp,
> >>> +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
> >>>                                      PROC_BOOT_CTRL_FLAG_R5_CORE_HALT=
, 0);
> >>>   }
> >>>
> >>>   static inline int k3_r5_core_run(struct k3_rproc *kproc)
> >>>   {
> >>> -     return ti_sci_proc_set_control(kproc->tsp,
> >>> +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
> >>>                                      0, PROC_BOOT_CTRL_FLAG_R5_CORE_H=
ALT);
> >>>   }
> >>>
> >>> @@ -328,7 +327,7 @@ static int k3_r5_rproc_prepare(struct rproc *rpro=
c)
> >>>               }
> >>>       }
> >>>
> >>> -     ret =3D ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ct=
rl, &stat);
> >>> +     ret =3D ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg=
, &ctrl, &stat);
> >>>       if (ret < 0)
> >>>               return ret;
> >>>       mem_init_dis =3D !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
> >>> @@ -469,7 +468,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >>>       dev_dbg(dev, "booting R5F core using boot addr =3D 0x%x\n", boo=
t_addr);
> >>>
> >>>       /* boot vector need not be programmed for Core1 in LockStep mod=
e */
> >>> -     ret =3D ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
> >>> +     ret =3D ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0=
);
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> @@ -612,7 +611,7 @@ static const struct rproc_ops k3_r5_rproc_ops =3D=
 {
> >>>    * by the System Processor.
> >>>    *
> >>>    * This function is used to pre-configure these settings for each R=
5F core, and
> >>> - * the configuration is all done through various ti_sci_proc functio=
ns that
> >>> + * the configuration is all done through various ti_sci_ctrl functio=
ns that
> >>>    * communicate with the System Processor. The function also ensures=
 that both
> >>>    * the cores are halted before the .prepare() step.
> >>>    *
> >>> @@ -654,7 +653,7 @@ static int k3_r5_rproc_configure(struct k3_rproc =
*kproc)
> >>>               core =3D kproc->priv;
> >>>       }
> >>>
> >>> -     ret =3D ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cf=
g, &ctrl,
> >>> +     ret =3D ti_sci_ctrl_proc_get_status(core->kproc->tsc, &boot_vec=
, &cfg, &ctrl,
> >>>                                    &stat);
> >>
> >> Here and everywhere else, fix the parantheses alignment:
> >>
> >> 258 +CHECK: Alignment should match open parenthesis
> >> 259 +#374: FILE: drivers/remoteproc/ti_k3_r5_remoteproc.c:652:
> >> 260 ++      ret =3D ti_sci_ctrl_proc_get_status(core->kproc->tsc,
> >> &boot_vec, &cfg, &ctrl,
> >> 261 +                                    &stat);
> >>
> >>>       if (ret < 0)
> >>>               return ret;
> >>> @@ -732,7 +731,7 @@ static int k3_r5_rproc_configure(struct k3_rproc =
*kproc)
> >>>                               clr_cfg &=3D ~PROC_BOOT_CFG_FLAG_R5_LOC=
KSTEP;
> >>>                               clr_cfg &=3D ~PROC_BOOT_CFG_FLAG_R5_TEI=
NIT;
> >>>                       }
> >>> -                     ret =3D ti_sci_proc_set_config(temp->kproc->tsp=
, boot_vec,
> >>> +                     ret =3D ti_sci_ctrl_proc_set_config(temp->kproc=
->tsc, boot_vec,
> >>>                                                    set_cfg, clr_cfg);
> >>>                       if (ret)
> >>>                               goto out;
> >>> @@ -740,14 +739,14 @@ static int k3_r5_rproc_configure(struct k3_rpro=
c *kproc)
> >>>
> >>>               set_cfg =3D PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
> >>>               clr_cfg =3D 0;
> >>> -             ret =3D ti_sci_proc_set_config(core->kproc->tsp, boot_v=
ec,
> >>> +             ret =3D ti_sci_ctrl_proc_set_config(core->kproc->tsc, b=
oot_vec,
> >>>                                            set_cfg, clr_cfg);
> >>>       } else {
> >>>               ret =3D k3_r5_core_halt(core->kproc);
> >>>               if (ret)
> >>>                       goto out;
> >>>
> >>> -             ret =3D ti_sci_proc_set_config(core->kproc->tsp, boot_v=
ec,
> >>> +             ret =3D ti_sci_ctrl_proc_set_config(core->kproc->tsc, b=
oot_vec,
> >>>                                            set_cfg, clr_cfg);
> >>>       }
> >>>
> >>> @@ -821,7 +820,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r=
proc *kproc)
> >>>
> >>>       core0 =3D list_first_entry(&cluster->cores, struct k3_r5_core, =
elem);
> >>>
> >>> -     ret =3D ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
> >>> +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &c_state);
> >>>       if (ret) {
> >>>               dev_err(cdev, "failed to get initial state, mode cannot=
 be determined, ret =3D %d\n",
> >>>                       ret);
> >>> @@ -845,7 +844,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r=
proc *kproc)
> >>>        */
> >>>       core->released_from_reset =3D c_state;
> >>>
> >>> -     ret =3D ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ct=
rl,
> >>> +     ret =3D ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg=
, &ctrl,
> >>>                                    &stat);
> >>>       if (ret < 0) {
> >>>               dev_err(cdev, "failed to get initial processor status, =
ret =3D %d\n",
> >>> @@ -1065,17 +1064,10 @@ static int k3_r5_cluster_rproc_init(struct pl=
atform_device *pdev)
> >>>                       goto out;
> >>>               }
> >>>
> >>> -             kproc->tsp =3D ti_sci_proc_of_get_tsp(cdev, kproc->ti_s=
ci);
> >>> -             if (IS_ERR(kproc->tsp)) {
> >>> -                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsp)=
,
> >>> -                                         "failed to construct ti-sci=
 proc control\n");
> >>> -                     goto out;
> >>> -             }
> >>> -
> >>> -             kproc->tsd =3D ti_sci_dev_of_get_tsd(cdev, kproc->ti_sc=
i);
> >>> -             if (IS_ERR(kproc->tsd)) {
> >>> -                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsd)=
,
> >>> -                                         "failed to construct ti-sci=
 dev control\n");
> >>> +             kproc->tsc =3D ti_sci_ctrl_of_get(cdev, kproc->ti_sci);
> >>> +             if (IS_ERR(kproc->tsc)) {
> >>> +                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsc)=
,
> >>> +                                         "failed to construct ti-sci=
 control\n");
> >>>                       goto out;
> >>>               }
> >>>
> >>> @@ -1086,13 +1078,13 @@ static int k3_r5_cluster_rproc_init(struct pl=
atform_device *pdev)
> >>>                       goto out;
> >>>               }
> >>>
> >>> -             ret =3D ti_sci_proc_request(kproc->tsp);
> >>> +             ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >>>               if (ret < 0) {
> >>>                       dev_err(cdev, "ti_sci_proc_request failed, ret =
=3D %d\n", ret);
> >>
> >> s/ti_sci_proc_request/ti_sci_ctrl_proc_request
> >>
> >>>                       goto out;
> >>>               }
> >>>
> >>> -             ret =3D devm_add_action_or_reset(cdev, k3_release_tsp, =
kproc->tsp);
> >>> +             ret =3D devm_add_action_or_reset(cdev, k3_release_tsp, =
kproc->tsc);
> >>>               if (ret)
> >>>                       goto out;
> >>>       }
> >>> diff --git a/drivers/remoteproc/ti_sci_ctrl.h b/drivers/remoteproc/ti=
_sci_ctrl.h
> >>> new file mode 100644
> >>> index 000000000000..76aee8c5317a
> >>> --- /dev/null
> >>> +++ b/drivers/remoteproc/ti_sci_ctrl.h
> >>> @@ -0,0 +1,177 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Texas Instruments TI-SCI Processor Controller Helper Functions
> >>
> >> Processor and Device
> >>
> >>> + *
> >>> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://=
www.ti.com/
> >>> + *   Suman Anna <s-anna@ti.com>
> >>> + */
> >>> +
> >>> +#ifndef REMOTEPROC_TI_SCI_CTRL_H
> >>> +#define REMOTEPROC_TI_SCI_CTRL_H
> >>> +
> >>> +#include <linux/of.h>
> >>> +#include <linux/soc/ti/ti_sci_protocol.h>
> >>> +
> >>> +/**
> >>> + * struct ti_sci_ctrl - structure representing a remoteproc control =
client
> >>> + * @sci: cached TI-SCI protocol handle
> >>> + * @dev: cached client device pointer
> >>> + * @dev_ops: cached TI-SCI device ops
> >>> + * @proc_ops: cached TI-SCI proc ops
> >>> + * @dev_id: TI-SCI device id for the consumer remoteproc device
> >>> + * @proc_id: processor id for the consumer remoteproc device
> >>> + * @host_id: host id to pass the control over for this consumer remo=
teproc
> >>> + *        device
> >>> + */
> >>> +struct ti_sci_ctrl {
> >>> +     const struct ti_sci_handle *sci;
> >>> +     struct device *dev;
> >>> +     const struct ti_sci_dev_ops *dev_ops;
> >>> +     const struct ti_sci_proc_ops *proc_ops;
> >>> +     u32 dev_id;
> >>> +     u8 proc_id;
> >>> +     u8 host_id;
> >>> +};
> >>> +
> >>> +static inline
> >>> +struct ti_sci_ctrl *ti_sci_ctrl_of_get(struct device *dev,
> >>> +                                    const struct ti_sci_handle *sci)
> >>> +{
> >>> +     struct ti_sci_ctrl *tsc;
> >>> +     u32 proc_ids[2];
> >>> +     int ret;
> >>> +
> >>> +     tsc =3D devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
> >>> +     if (!tsc)
> >>> +             return ERR_PTR(-ENOMEM);
> >>> +
> >>> +     ret =3D of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> >>> +                                &tsc->dev_id);
> >>> +     if (ret < 0)
> >>> +             return ERR_PTR(ret);
> >>> +
> >>> +     ret =3D of_property_read_u32_array(dev_of_node(dev), "ti,sci-pr=
oc-ids",
> >>> +                                      proc_ids, 2);
> >>> +     if (ret < 0)
> >>> +             return ERR_PTR(ret);
> >>> +
> >>> +     tsc->dev =3D dev;
> >>> +     tsc->sci =3D sci;
> >>> +     tsc->dev_ops =3D &sci->ops.dev_ops;
> >>> +     tsc->proc_ops =3D &sci->ops.proc_ops;
> >>> +     tsc->proc_id =3D proc_ids[0];
> >>> +     tsc->host_id =3D proc_ids[1];
> >>> +
> >>> +     return tsc;
> >>> +}
> >>> +
> >>> +/* Power-management helper functions */
> >>> +static inline int ti_sci_ctrl_dev_is_on(struct ti_sci_ctrl *tsc, boo=
l *r_state,
> >>> +                                 bool *c_state)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->dev_ops->is_on(tsc->sci, tsc->dev_id, r_state, c_s=
tate);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci device is_on failed: %d\n", r=
et);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/* Request power on to rproc */
> >>> +static inline int ti_sci_ctrl_dev_get_device(struct ti_sci_ctrl *tsc=
)
> >>> +{
> >>> +     int ret =3D 0;
> >>
> >> Initialization not needed.
> >>
> >>> +
> >>> +     ret =3D tsc->dev_ops->get_device(tsc->sci, tsc->dev_id);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci device get failed: %d\n", ret=
);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/* Request power off to a rproc */
> >>> +static inline int ti_sci_ctrl_dev_put_device(struct ti_sci_ctrl *tsc=
)
> >>> +{
> >>> +     int ret =3D 0;
> >>
> >> Initialization not needed.
> >>
> >>> +
> >>> +     ret =3D tsc->dev_ops->put_device(tsc->sci, tsc->dev_id);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci device put failed: %d\n", ret=
);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/* Processor control helper functions */
> >>> +static inline int ti_sci_ctrl_proc_request(struct ti_sci_ctrl *tsc)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->request(tsc->sci, tsc->proc_id);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor request failed: %d\=
n",
> >>> +                     ret);
> >>
> >> Here and everywhere else, can you add an empty line before return
> >> statement? No hard and fast rule, but this has been followed
> >> throughout the existing TI remoteproc drivers.
> >>
> >> Thanks,
> >> Beleswar
> >>
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline int ti_sci_ctrl_proc_release(struct ti_sci_ctrl *tsc)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->release(tsc->sci, tsc->proc_id);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor release failed: %d\=
n",
> >>> +                     ret);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline int ti_sci_ctrl_proc_handover(struct ti_sci_ctrl *tsc)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->handover(tsc->sci, tsc->proc_id, tsc->ho=
st_id);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor handover of %d to %=
d failed: %d\n",
> >>> +                     tsc->proc_id, tsc->host_id, ret);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline int ti_sci_ctrl_proc_set_config(struct ti_sci_ctrl *ts=
c,
> >>> +                                      u64 boot_vector,
> >>> +                                      u32 cfg_set, u32 cfg_clr)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->set_config(tsc->sci, tsc->proc_id, boot_=
vector,
> >>> +                                     cfg_set, cfg_clr);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor set_config failed: =
%d\n",
> >>> +                     ret);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline int ti_sci_ctrl_proc_set_control(struct ti_sci_ctrl *t=
sc,
> >>> +                                       u32 ctrl_set, u32 ctrl_clr)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->set_control(tsc->sci, tsc->proc_id, ctrl=
_set,
> >>> +                                      ctrl_clr);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor set_control failed:=
 %d\n",
> >>> +                     ret);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static inline int ti_sci_ctrl_proc_get_status(struct ti_sci_ctrl *ts=
c,
> >>> +                                      u64 *boot_vector, u32 *cfg_fla=
gs,
> >>> +                                      u32 *ctrl_flags, u32 *status_f=
lags)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D tsc->proc_ops->get_status(tsc->sci, tsc->proc_id, boot_=
vector,
> >>> +                                     cfg_flags, ctrl_flags, status_f=
lags);
> >>> +     if (ret)
> >>> +             dev_err(tsc->dev, "ti-sci processor get_status failed: =
%d\n",
> >>> +                     ret);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +#endif /* REMOTEPROC_TI_SCI_CTRL_H */
> >>> diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_=
sci_dev.h
> >>> deleted file mode 100644
> >>> index 897998a97d7f..000000000000
> >>> --- a/drivers/remoteproc/ti_sci_dev.h
> >>> +++ /dev/null
> >>> @@ -1,82 +0,0 @@
> >>> -/* SPDX-License-Identifier: GPL-2.0-only */
> >>> -/*
> >>> - * Texas Instruments TI-SCI Device Controller Helper Functions
> >>> - *
> >>> - * Copyright (C) 2026 Texas Instruments Incorporated - https://www.t=
i.com/
> >>> - */
> >>> -
> >>> -#ifndef REMOTEPROC_TI_SCI_DEV_H
> >>> -#define REMOTEPROC_TI_SCI_DEV_H
> >>> -
> >>> -#include <linux/soc/ti/ti_sci_protocol.h>
> >>> -#include <linux/pm_runtime.h>
> >>> -
> >>> -/**
> >>> - * struct ti_sci_dev - structure representing a device control clien=
t
> >>> - * @sci: cached TI-SCI protocol handle
> >>> - * @ops: cached TI-SCI device ops
> >>> - * @dev: cached client device pointer
> >>> - * @dev_id: TI-SCI device id for the consumer remoteproc device
> >>> - */
> >>> -struct ti_sci_dev {
> >>> -     const struct ti_sci_handle *sci;
> >>> -     const struct ti_sci_dev_ops *ops;
> >>> -     struct device *dev;
> >>> -     u32 dev_id;
> >>> -};
> >>> -
> >>> -static inline
> >>> -struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
> >>> -                                      const struct ti_sci_handle *sc=
i)
> >>> -{
> >>> -     struct ti_sci_dev *tsd;
> >>> -     int ret;
> >>> -
> >>> -     tsd =3D devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
> >>> -     if (!tsd)
> >>> -             return ERR_PTR(-ENOMEM);
> >>> -
> >>> -     ret =3D of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> >>> -                                &tsd->dev_id);
> >>> -     if (ret < 0)
> >>> -             return ERR_PTR(ret);
> >>> -
> >>> -     tsd->dev =3D dev;
> >>> -     tsd->sci =3D sci;
> >>> -     tsd->ops =3D &sci->ops.dev_ops;
> >>> -
> >>> -     return tsd;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_s=
tate,
> >>> -                                bool *c_state)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state=
);
> >>> -     if (ret)
> >>> -             dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", r=
et);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsd->ops->get_device(tsd->sci, tsd->dev_id);
> >>> -     if (ret)
> >>> -             dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret=
);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsd->ops->put_device(tsd->sci, tsd->dev_id);
> >>> -     if (ret)
> >>> -             dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret=
);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -#endif /* REMOTEPROC_TI_SCI_DEV_H */
> >>> diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti=
_sci_proc.h
> >>> deleted file mode 100644
> >>> index f3911ce75252..000000000000
> >>> --- a/drivers/remoteproc/ti_sci_proc.h
> >>> +++ /dev/null
> >>> @@ -1,130 +0,0 @@
> >>> -/* SPDX-License-Identifier: GPL-2.0-only */
> >>> -/*
> >>> - * Texas Instruments TI-SCI Processor Controller Helper Functions
> >>> - *
> >>> - * Copyright (C) 2018-2020 Texas Instruments Incorporated - https://=
www.ti.com/
> >>> - *   Suman Anna <s-anna@ti.com>
> >>> - */
> >>> -
> >>> -#ifndef REMOTEPROC_TI_SCI_PROC_H
> >>> -#define REMOTEPROC_TI_SCI_PROC_H
> >>> -
> >>> -#include <linux/soc/ti/ti_sci_protocol.h>
> >>> -
> >>> -/**
> >>> - * struct ti_sci_proc - structure representing a processor control c=
lient
> >>> - * @sci: cached TI-SCI protocol handle
> >>> - * @ops: cached TI-SCI proc ops
> >>> - * @dev: cached client device pointer
> >>> - * @proc_id: processor id for the consumer remoteproc device
> >>> - * @host_id: host id to pass the control over for this consumer remo=
teproc
> >>> - *        device
> >>> - */
> >>> -struct ti_sci_proc {
> >>> -     const struct ti_sci_handle *sci;
> >>> -     const struct ti_sci_proc_ops *ops;
> >>> -     struct device *dev;
> >>> -     u8 proc_id;
> >>> -     u8 host_id;
> >>> -};
> >>> -
> >>> -static inline
> >>> -struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
> >>> -                                        const struct ti_sci_handle *=
sci)
> >>> -{
> >>> -     struct ti_sci_proc *tsp;
> >>> -     u32 temp[2];
> >>> -     int ret;
> >>> -
> >>> -     ret =3D of_property_read_u32_array(dev_of_node(dev), "ti,sci-pr=
oc-ids",
> >>> -                                      temp, 2);
> >>> -     if (ret < 0)
> >>> -             return ERR_PTR(ret);
> >>> -
> >>> -     tsp =3D devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> >>> -     if (!tsp)
> >>> -             return ERR_PTR(-ENOMEM);
> >>> -
> >>> -     tsp->dev =3D dev;
> >>> -     tsp->sci =3D sci;
> >>> -     tsp->ops =3D &sci->ops.proc_ops;
> >>> -     tsp->proc_id =3D temp[0];
> >>> -     tsp->host_id =3D temp[1];
> >>> -
> >>> -     return tsp;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->request(tsp->sci, tsp->proc_id);
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor request failed: %d\=
n",
> >>> -                     ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_release(struct ti_sci_proc *tsp)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->release(tsp->sci, tsp->proc_id);
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor release failed: %d\=
n",
> >>> -                     ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_handover(struct ti_sci_proc *tsp)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->handover(tsp->sci, tsp->proc_id, tsp->host_id=
);
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor handover of %d to %=
d failed: %d\n",
> >>> -                     tsp->proc_id, tsp->host_id, ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_set_config(struct ti_sci_proc *tsp,
> >>> -                                      u64 boot_vector,
> >>> -                                      u32 cfg_set, u32 cfg_clr)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->set_config(tsp->sci, tsp->proc_id, boot_vecto=
r,
> >>> -                                cfg_set, cfg_clr);
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor set_config failed: =
%d\n",
> >>> -                     ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_set_control(struct ti_sci_proc *tsp,
> >>> -                                       u32 ctrl_set, u32 ctrl_clr)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->set_control(tsp->sci, tsp->proc_id, ctrl_set,=
 ctrl_clr);
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor set_control failed:=
 %d\n",
> >>> -                     ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -static inline int ti_sci_proc_get_status(struct ti_sci_proc *tsp,
> >>> -                                      u64 *boot_vector, u32 *cfg_fla=
gs,
> >>> -                                      u32 *ctrl_flags, u32 *status_f=
lags)
> >>> -{
> >>> -     int ret;
> >>> -
> >>> -     ret =3D tsp->ops->get_status(tsp->sci, tsp->proc_id, boot_vecto=
r,
> >>> -                                cfg_flags, ctrl_flags, status_flags)=
;
> >>> -     if (ret)
> >>> -             dev_err(tsp->dev, "ti-sci processor get_status failed: =
%d\n",
> >>> -                     ret);
> >>> -     return ret;
> >>> -}
> >>> -
> >>> -#endif /* REMOTEPROC_TI_SCI_PROC_H */

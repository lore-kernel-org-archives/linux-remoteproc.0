Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215B402435
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814781; cv=pass; b=mKr10nmVeEWJg6DTb4gAi4UWUX1DfkkjME/YIcKtLvDnj+mi2ko8GdsRoKhDiU9aVUMSnWgx9S0Hq4Lilq58ZPTpoS4gqzbkeAV1oali+fRdfiEUCc84zsI1Luf0GdelPKQ+ABcwyQ3csS115/22Y8dUIq/CSEHQrPTalplBRME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814781; c=relaxed/simple;
	bh=Eg/La2K8fUgjR+CXgDRFQt41tnn3tk9rVY/sbi17ZxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLQ/d/6cC5GypPpUc9zkdeLoX8RSTN6NcN7eRkN5Pl8LYZ+AaPPZc9bKhTlLsjhLLoXtQonD+mYNMa5wPerjm/WoaCdtP5H+6+ytjnsXsrtbvaq+JYbWM+PBY4KB+51YjuHraaZ4gepzGx0qYzzdLP3zQsKej7alGujrVAZL5uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5tjm6S5; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5tjm6S5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68914995e35so4687331a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 09:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779814778; cv=none;
        d=google.com; s=arc-20240605;
        b=fpVmSgb7jw9PL3pzuxbBm5qmTg2zGZAwZ9qgOP6LZaQFZ1LG4qCflrYuwRIh5rPx7g
         1QsH5GJcfjT9JjsOYQiH02cDRF0n/Z3tsbij7oL8RNEz9Y+kx6O8oDCvBIBLwNnW49Ho
         5LZOqgUO+lYcagAytIfhwXedGIfwfkD2bRiNcn9vlya5SMD8XWZxvYgLyrDv/Z63IfJ7
         ZfAkz6NXCxa0DJaDJEuqogQP4JmLPuyHaCGqKiI4Tkw0lz+VE+NjRO6U3AgCgsX9AO4s
         dGfcW0FIhUKXmG5vF5Dqjd1cWRIorjb8a3QIbGQ1euSmsdiQhS+0au8ZCA4se2fYc40o
         MIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RQHqlrbgdiZdsIcepx+OoxTaXVkYpFnEb/A1wnJW+jU=;
        fh=0Ke6yBizx/vGKP4Fr3nftyBT+WwoPrmqXXVDhA97fSo=;
        b=ZVjyBm5Vj4lz8CvQaLE0mIdQZWtmNVaANYJ5SsQ0sTQFMUEhPSY43boDJMzX1fnFZC
         nVCHPSXvNGp9xnWD/1tg6hzXxtTMkZGVkXlfkk7pjunMc0MB/MQoNii9G4j2HaVMjuWJ
         +5AOuB/5pbJ+Hlgn4YA8wPrjmQD6FowCEYO0h+6IKeuU6rGfL1vHWqq+6vzza67P8r3W
         Zb38RDSXNZOjE5Xjophy29kS2Gxvijvx06xIKm903CZWbloez8Sof7BdEgLmeXEwO5K+
         ri/gt+oE8rAHp58OVEzos3tEGmTHp2Q8cR3uf13buNIkebQtDqB0SucitNfgMSArQiGv
         L5HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779814778; x=1780419578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RQHqlrbgdiZdsIcepx+OoxTaXVkYpFnEb/A1wnJW+jU=;
        b=Y5tjm6S5Ka7NYWF3/QznYQicddyi2LXq3wNVTHNJecKY3P5RBcoBHcCG3xSdSDqewk
         zLERekS7zcssLeNb1Gma6LgG8SxSamKZxFOsifhw3XvVSYKkfoccV6FPXXOo40pp0K/j
         wYdEiZQ2Shds7tZKVflPa/Zjfw/xMVTim8TIrYTp/oI3Qobq8wt2V4y9uu8DEqe3aaE1
         //ucuI3lq39LLTSCSuo8NcEGo1GN6CNZdurPE5sdSaVsEEpEugQhgcp3hfVa+DEQ7HrT
         Pb/PNgZGcpLjiRpeaq4bcpk2nzkloK7PhjkwbrHdmr2CNifbu9Usb3ZgNeF5FHSfvwhX
         gyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814778; x=1780419578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQHqlrbgdiZdsIcepx+OoxTaXVkYpFnEb/A1wnJW+jU=;
        b=maCMerCBsOrZFeaAIBJjcikRSneBZm1u3yTNZmXWLWwB8QAf29NXYP8KK4PYkLvj2A
         sXZeHUELbLuLiSRtlyqyjRe2kCvXtwMMZ4UB+7NGpDwiYurCPVlpoZemqvBugd2JjU1E
         U5ZRCnSCFRjZaHr3rFv+PzOl63MfSFaPDo4tbrIH60GvKzkvMJZx3Uw/rpGjNuj8Ji/Q
         v4IJuLJVMtnDXlkaMLrGvjwN6bTHK571b+qWmhj+ihi+3Cx6VQ3UJZYh4MmPGSGQoLVi
         wE/vk8KB7tEp7N8/dc4SnhnippDOOAKcCB540xIO35Hm1vr+XOMnzF6V95ZQI8fQhuBP
         ASIw==
X-Forwarded-Encrypted: i=1; AFNElJ+H+IUIRy+p5YTs7pwP9wFcu5VS439oVRxFgVQsuNgJKGC1ywphI8MK8fT+UYeJgjssHBGB5B8RIvN12vfW0SAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr27Uqjs6JTqWOiZQxDreKlVvi0rYBnfRvb585oBVFpDc0Os51
	3MklR5dMAd5TqLzXm7AcTo719DCwEoKmySqf49sAls2EGOoRAR6mF92a3S/+zRZJmJ9YGPaNsSb
	bv/x4+T7wAQI/o6z5Fo0HPUBo7I5t0UjtOG9H4Nw8gznTh7kBNk+F
X-Gm-Gg: Acq92OEDdRvtjRgJl1GO40fyEJVwrQVPeZIXVpp0fIj2FpcaKD5wrIKrzYXF5mqz1UO
	NwJOrW8ol4zcFCNGzxavyOJ5hjGSdB14DdjpDO1ybjSdVuiNluiWgcoYwop5L3lU5npUeeZ8i0c
	zgRfOskPkNElj/Ywl3ipx4PtMxT1MX1p/54Z7vSZJ1dXb5rgtB0wzIkNVLmOa7q3U+MuTjmYOxB
	ZORRElYAxC3lAei5LrnTAExTnmMybYDx8bdeEN8zPfzDdBXnly+FHBEE98Im8oynGgpwyyxmSpU
	2szjO9Si4yvKzJBZ2PsTjoW+Zl46IG89JlkEZ985Yw==
X-Received: by 2002:a17:907:774a:b0:bde:1084:d321 with SMTP id
 a640c23a62f3a-bde1084dd0emr839039066b.47.1779814778599; Tue, 26 May 2026
 09:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508174006.3783082-1-tanmay.shah@amd.com> <ahWy2AxRwWYwg9o1@p14s>
 <55312255-df5a-4bbd-8088-857f73949098@amd.com>
In-Reply-To: <55312255-df5a-4bbd-8088-857f73949098@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 26 May 2026 10:59:27 -0600
X-Gm-Features: AVHnY4I828P8mj267Lw7K9vsUU37APbDssK1aXz58tLwH7oS4B3DcR7GYj6_Ahk
Message-ID: <CANLsYkznO=ByRi=LP2t2PtUJYX-LbP8JnMbBEX=+ieTpdAkFUQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: remove binding header dependency
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 10:27, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/26/2026 9:48 AM, Mathieu Poirier wrote:
> > On Fri, May 08, 2026 at 10:40:06AM -0700, Tanmay Shah wrote:
> >> Bindings can be deprecated and driver should not include bindings
> >> headers directly. Instead define needed constants in the driver.
> >>
> >
> > Is there an official directive about not including bindings in drivers?  To me
> > it seems advantageous to have a focal point for the definition of constants,
> > guaranteeing eveyone uses the same values.
> >
>
> This is what I found from here:
> https://docs.kernel.org/process/maintainer-soc.html
>
> 2.3.2. Driver Branch Dependencies
>
> "Avoid defining custom macros in include/dt-bindings/ for hardware
> constants that can be derived from a datasheet -- binding macros in
> header files should only be used as a last resort if there is no natural
> way to define a binding"
>
> Also, bindings can be deprecated, so if the current binding gets
> deprecated, the header file can be removed from the include/dt-bindings.
>

Fair enough.  I'll apply your patch tomorrow.

> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 45a62cb98072..f5b736fa3cb4 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -4,7 +4,6 @@
> >>   *
> >>   */
> >>
> >> -#include <dt-bindings/power/xlnx-zynqmp-power.h>
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/firmware/xlnx-zynqmp.h>
> >>  #include <linux/kernel.h>
> >> @@ -19,6 +18,11 @@
> >>
> >>  #include "remoteproc_internal.h"
> >>
> >> +#define             PD_R5_0_ATCM    15
> >> +#define             PD_R5_0_BTCM    16
> >> +#define             PD_R5_1_ATCM    17
> >> +#define             PD_R5_1_BTCM    18
> >> +
> >>  /* IPI buffer MAX length */
> >>  #define IPI_BUF_LEN_MAX     32U
> >>
> >>
> >> base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd
> >> --
> >> 2.34.1
> >>
>

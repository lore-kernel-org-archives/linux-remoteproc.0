Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E653C150
	for <linux-remoteproc@vger.kernel.org>; Fri,  1 Mar 2024 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709254243; cv=none; b=Ja7aPjrUB97tGJbHUBRqqy2JwpBLnfGYwPoeretkbGTKkjBQhJKtii33ghK3+C+2Swv3opFRxveF2SJMo3fJoZ1AA73qeE/BMULlvvjDpSQJd67P2alxbgyiyvvo7W5E0ZvJSDzftOGI4UY6OKXgfHOwGtmcIqFK1bDxzI3K6Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709254243; c=relaxed/simple;
	bh=CHaFe2U1BELmHABPqs1ra6MQ6WF55y/yWPtwz7/PtG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr/BdoA256IFxFbGQdK8eVIgjsHlbXGogQuTCSOUq29iZUlEmr6UME0KTKNyTDbuKCd+G9xuhCJt102so0Gty7I/0vOMzNAQOhD4HlVDK507BV5kSUVfnl6cRX1UfeBuq9Oap8Q2svoM35GpLZjfMk/SlMaJA0cQWqL39Xdr0Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsZo4m6d; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsZo4m6d"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so1581730276.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 16:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709254240; x=1709859040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnvogRONe3XITKcvwUiXTJV9XpAUGTW6Ba9EKEvdg2c=;
        b=BsZo4m6dkRJIiHZbG3EbHyIJ/e37yzVRwu0uw9aSqfZt1AMmwTj/AXnp/e3zYpxm9e
         smnrejAiFguL7wmSHKm/AYJuJuZFJD+bhKOZxnGfSNJHU1HHgiqXGeRCVvsfg9UXiG7k
         F3L6ISsDO2FFs3r/bFzCGh1vfGWuzMxPfez7SSZxwWwh0YObtzHPkmvhG5SRWe77zaPK
         6mCoo9YVvNx8QQ+nRfgTAEb4x0WhhhHvjZf3RxO4QLVtrF7ZtVIBr28SfCEn7kjJN05q
         +5eCJbKsfdL7MvrGB7GfnKQhyXPfGlnnG39XR4zkLlWOs33qvp/l1iEnQbbe7JOdTM5H
         iS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709254240; x=1709859040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnvogRONe3XITKcvwUiXTJV9XpAUGTW6Ba9EKEvdg2c=;
        b=c5aVz3+j1OIioKqHiPBPi3SUzK79lQI/4eNk/02bJKjZ140ToK8jMaxLPHhOD7xSvK
         EfaMuZJU2Ob7kTXPFNQoB6x9M10X5352jIxYSvo95pIg1CHWuanh4NFuGId7WADkyvH8
         M9/qcdwCIq4myvrTnN0cZpzq1Fbvjv5GQHmmvvSaVRGERXsWhKMISoUniJ+4A5QO0oXn
         vOfKYOADK1CCgdX104OIAkrxCCOtE+GpVeeR8LOM38aQTtti3XOt3LLV5njLSVlBHtrf
         VlJOVLGjQyPrI1uNa7luKJdYyzleOf9TKBtzF7wY21MLdRRYaZAmGwosTe/cfljnyztX
         t4Og==
X-Forwarded-Encrypted: i=1; AJvYcCXzT3VbbYV2HjTy5PIc4adVx2AFujOgN5p95lZXMkIoEg4fH9d3HsK7McSBZxmItPtIvEQP31450j7f6CzPapJtqcYDXgPKQEhDlnYOiK0JBg==
X-Gm-Message-State: AOJu0YzOn7oEqgXJ1HjxlnTBZewufd80DfnsetOe2l3iWhIC+Fm366iE
	fmARQ1gAet0cmy9HDbezs3rDXSue9o+VuJ08wnbUjsl0tkcEm2Sf5Wt5MsumMwmJ1JN5Ucxg9hm
	zmznhnPTuKG+7VPkP+Elep6HD5uAf8LvwkmKeefqWiwI6IbM9A2E=
X-Google-Smtp-Source: AGHT+IFM0L1Wruj7VXlBG7xBnpqBnUoxX0KR0ks/vnv8ECeWSCE9OTUifnqgru8CT5o74SzEX7I784pPBQQxYuiKEZo=
X-Received: by 2002:a25:af4a:0:b0:dc7:4776:e31 with SMTP id
 c10-20020a25af4a000000b00dc747760e31mr31342ybj.24.1709254239907; Thu, 29 Feb
 2024 16:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Mar 2024 02:50:28 +0200
Message-ID: <CAA8EJpo11gNRP1sYBXva4doOvuzuEsbR3pVgS1FdWqtwB0bNGA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/5] soc: qcom: add in-kernel pd-mapper implementation
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Mar 2024 at 01:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
>
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
>
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
>
> NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
> (especially for SM6xxx and SC7xxx platforms), which is reflected by
> several TODO and FIXME comments in the code.
>
> Changes since RFC v1:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp

After sending this RFC I have stumbled upon another issue on sc8280xp
/ X13s. I'll send v3 after finding a way to fix it.

> - Added missing configuration for QCS404
>> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


-- 
With best wishes
Dmitry

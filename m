Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF52D12F3
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 03:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768362846; cv=none; b=ZgaYp+xFWf7F2ARruEQfwhKGfa1u+Pb8FiS5XFucFxrSfC7s0jbWDjVxqiH+FKg5q4dArCVyyuXu8yb1QQWZn6YOYapP2Of/vmmp/g/4XG24ZCznSuNEGNSikrgWuisXQmDOT2yB9AIgdYNYIIZAy0gYtIgS5xvoSQbrJJbtC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768362846; c=relaxed/simple;
	bh=49Agcpa3CyOrsrq3mxJxyGH0gvBgFmZs5flbI2qCHE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJtK5WkQS+2dDEtuL1kPn6UpOISo3gXOoH3ZrfZUqziaG+zvyoo657TuKqD4L0BgP36TP1M4nsGkgcg0AGY4n8QOq8Wb2gvoenedKronlyPBlr3M/5DszM2q5w08xeIBw9Z+8h30z7jGG8hQ04y47TqJnuc56qBXD/kEPvZB07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHff7knx; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHff7knx"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45a84c6746cso2030675b6e.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 19:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768362844; x=1768967644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os7psBao2TAcJgN/WPhuBCCHt5VJwqCGY+lkgH3GuIM=;
        b=BHff7knxIjXR9o3S5bPVLTTdCSxKsLlqepizM9GDtWS+Irqt86qwnMIS6dnFrobbz0
         NdEgeFsncS1cz08u3mqtV/V0mwzaqcM1ieLj0KBi83FNarTGCQ26kh1gfb6oQQ3fNvjk
         uThReZYl10EdvAGhSYMXu7NB9TILMYJktuVNeO9y9a6P1iCwZBaHiC+H89Hqd2Rj03Ty
         SGfHjFYI/z9By6N0Kz5Gh7wYI4DGuBwmvX5sOBaa3UZp/y7DSwn2hjuN2ZGt0+91OfiF
         ZR6MxyfT3FNgXmxmHnXcFpLZLHQsvXXFK8zqq1ImRopO0lSkzuJlPdZJLRzlhIyQcODQ
         PNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768362844; x=1768967644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=os7psBao2TAcJgN/WPhuBCCHt5VJwqCGY+lkgH3GuIM=;
        b=HpB0L46WFOgjTuCqd1ef3Dqsr+Ncc6FQXn1nr0f5l8XBJwD6BOhMFvT1VCkQumVHXJ
         nOX7SXbv5Hv1lhfOsGkZxPG5HRK2zTztMF83viXnHEAOAC2NQVHum1RxrTMr7eW3mYfJ
         ZihHBckw1Xr6+VI2/BAcATIK1oOUvsm3CkKco6qNeh0Hp02l3GTQox5+Ocn2vfsJ+ikF
         1wtB4qbCV1QTAoG09ue0L6SqRKPA8AVc7t+/XyleKEfmRNNxNMEk32adzzpKuBUgpxdR
         gobtp5oXU1OHPoz8bcVdAnWDhN9k905F6UBkFL9x61qX/nFL7yKnAWD5FBJhAg5E/pqY
         F+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUsHmXbIrJECyC77PAHmpAEWrYrx8GOum0RgoLFEaM2G7bHqM7aynX/mYFm3BUgvt2rJKzYBHslY63xw/e58k2D@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5niqfEMppLcn7WBxy5zTaUEc4JaHWDacwC+lJ37nay83D4gT
	ECN1sdL0a0fP4ljmX6iq084z/24boEE0EgIk3nAlhoXqTjwH0z5MboAN
X-Gm-Gg: AY/fxX5ICaM2GITESWAT5Rutf5F+UjwSDhcvIKoUNGXE9JSwoLazPwUeaPP6XaE8NGS
	LCT+rfyhsaqUeW/xxlsPkSJLrdhYmJM5ETJud1LWyzen99rPjch/U9t5SatrXwA4yrVO4lLo58c
	lSbDZXuPlzUTMN/R1gbznubZ+u6GTHX0sRu4H32Yt349UnDkLjjuwJjXINVOullR92UjhDu8Whm
	4PTB/c/TrcaoW795xoJKqm2D38BgUPkNMB+dHVMRtKUCXwMrXv/yDfvHzijjMWi1x0XH4ZVY7D2
	Q/TgLkrU8gWnm1pOu55QGhR96Oq4Smy8auxiZHp8dq2AZqjzQDzHmDLFhWvhqnHvMDtRLyjEUQY
	hZIK/yzshVK+99Ou9nJ6OzaRhMW1DJHhAfFIUc0Ylh2DM6RU+TLOn+XrTrae6jFnbZndmho5/mA
	YAsiQvqkbxIyJ3mr8OG56mdQaSkb0RX3TvvwOCxf+gVsA2GE626xgog+CNSnKW721ta49zBlQLj
	soWU72QczEEZz3Sa+ivuebcBMrsQcgLsmGj8pfFMQ==
X-Received: by 2002:a05:6808:c14b:b0:455:d4ee:bb2a with SMTP id 5614622812f47-45c7142ffafmr1012777b6e.5.1768362844292;
        Tue, 13 Jan 2026 19:54:04 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa50721a6sm15877468fac.10.2026.01.13.19.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 19:54:02 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Tue, 13 Jan 2026 21:54:00 -0600
Message-ID: <4814455.tdWV9SEqCh@nukework.gtech>
In-Reply-To: <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> > driver. This firmware is usually used to run ath11k firmware and enable
> > wifi with chips such as QCN5024.
> > 
> > When submitting v1, I learned that the firmware can also be loaded by
> > the trustzone firmware. Since TZ is not shipped with the kernel, it
> > makes sense to have the option of a native init sequence, as not all
> > devices come with the latest TZ firmware.
> > 
> > Qualcomm tries to assure us that the TZ firmware will always do the
> > right thing (TM), but I am not fully convinced
> 
> Why else do you think it's there in the firmware? :(

A more relevant question is, why do some contributors sincerely believe that 
the TZ initialization of Q6 firmware is not a good idea for their use case?

To answer your question, I think the TZ initialization is an afterthought of 
the SoC design. I think it was only after ther the design stage that it was 
brought up that a remoteproc on AHB has out-of-band access to system memory, 
which poses security concerns to some customers. I think authentication was 
implemented in TZ to address that. I also think that in order to prevent clock 
glitching from bypassing such verification, they had to move the initialization 
sequence in TZ as well.

Alex






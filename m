Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD885938
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 Mar 2024 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044348; cv=none; b=K+vGu7hb+6NweSkWpPguV4shApEtzfMvCv0LcbZWLrD//2qvnDbz+bHvSxDLwoS4MBx/YoQhE99yWfHxsVpOxEHr3XOA6thQ4NA5l9V4LqnI6bqxybNIlIIATl9WyTIYvBkz6S7CmErpr/9TRZ8Vnuhf5fcnK71mDkOc3LZEoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044348; c=relaxed/simple;
	bh=i30qiLYfNUY72DfrE1cT/dPxNGz6ipB+9wUBiDjUtho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BW879J2wZgK5U0glpKVec9DPiPDEpPiXSHGHqPiNevcMlPfvt9KSwMsxmOwd/Bdb3S1SHQ1NXTneJrjha6cM+Y1gUem+VB3SlsSPJRAjIG7XlWvrfdiGeneJZ5ViIS1642GQ3/Sc31M97sabTsA6gOUXJQGCQ90+zdaRL8RzcN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UjXTY4ym; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UjXTY4ym"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513e6777af4so2469149e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Mar 2024 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711044344; x=1711649144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh+H36p7va+V4Lc6HuD7WLMtjuJ+MxeQtzJ/2W8wqJg=;
        b=UjXTY4ymnQ8pHfFiOg5LFlLTK4gx2hjlhdNQij2MVaLfLQV9Km1vxSSo1DOnidt2O8
         zck2cn/UH4mP/IMHI49wp0iwK7b62cQMD9Fdx1fXigDzw0jGTQULqjjtfy+G4m9qh5ON
         vUDAZP3ZfuP61LH3fbfFrz1bsa5uEiAndJURc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711044344; x=1711649144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh+H36p7va+V4Lc6HuD7WLMtjuJ+MxeQtzJ/2W8wqJg=;
        b=OTcxdEXlZ25NZXVaIDePnP/LM8L0ZjyXUk2aRv7nNXzSh9US6ZPRhIlM+X9Y/G0vWd
         iySz8G1OCfwmv+zRlgcFI3TmgmZTSNOXDEDLCn1UKkslJBTale2Kw6VLEcjfJ1wH1Hmp
         aXvtMYRYdUTTyBGbZa+i0jZb8khLFdi4/zv9fqtBE/iyBLpJzCswGv08bZVxAVXbrgZm
         TO2BtdfzUxqBpZQsHX+xwJ2/bQnwTGSo1ReruFopeygIbteZLvPccb8/RbahzqBlnpa1
         FWA5G5Ft+VlyfEVi+D4vOiTYUicDyLZdLsxZxdfgPq7PQ/xeVmL6OlwgepJJWmYsIysM
         1M+Q==
X-Gm-Message-State: AOJu0Yzh7RGJsvv7R3bSRVNPVmHZN/ga6BG4CsoenDCWaG6PpaVaycq/
	2cUG2HyxYP3hSYc3jgHKJDKzTviZ5R/7M6ukolRCEXYg5foNPMkHk9DzbB/QJ/eFTmuMSfEXWco
	46OaNXg==
X-Google-Smtp-Source: AGHT+IHfMLiGf0SAUht8p5nI30nMq0PXwhRbMySrjCBOnRKgLZBJOgbI5B7VLP5OguzVIWAfhfwDMg==
X-Received: by 2002:a19:9149:0:b0:512:e02f:9fa7 with SMTP id y9-20020a199149000000b00512e02f9fa7mr127844lfj.1.1711044344095;
        Thu, 21 Mar 2024 11:05:44 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id v7-20020a05651203a700b005134751aca7sm23937lfp.275.2024.03.21.11.05.43
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 11:05:43 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4a901e284so28026991fa.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Mar 2024 11:05:43 -0700 (PDT)
X-Received: by 2002:a05:6512:46a:b0:513:bed1:5069 with SMTP id
 x10-20020a056512046a00b00513bed15069mr120672lfd.13.1711044343093; Thu, 21 Mar
 2024 11:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321125518.1675903-1-andersson@kernel.org> <yniwjzjynmyndzqglfmwpy2th3vtadmms6ifxqs2ojo7wr66ne@ydnr3rltaddn>
In-Reply-To: <yniwjzjynmyndzqglfmwpy2th3vtadmms6ifxqs2ojo7wr66ne@ydnr3rltaddn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Mar 2024 11:05:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQA+Cj-_LtVuw-1n9jwrQ9pO8kVYBNNkA7OHHCDbFR0Q@mail.gmail.com>
Message-ID: <CAHk-=wgQA+Cj-_LtVuw-1n9jwrQ9pO8kVYBNNkA7OHHCDbFR0Q@mail.gmail.com>
Subject: Re: [GIT PULL] remoteproc updates for v6.9
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Davis <afd@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:03, Bjorn Andersson <andersson@kernel.org> wrote:
>
> I was further notified that this conflicts with your tree, Linus. Below
> is the resolution for this conflict.

Heh. This email came in after the pr-tracker-bot email notifying you
that it's already done..

I think I got it all right, it didn't seem at all controversial, but
maybe you should double-check.

          Linus

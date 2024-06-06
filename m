Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BCC44C68
	for <linux-remoteproc@vger.kernel.org>; Thu,  6 Jun 2024 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707858; cv=none; b=nx60JHPB8jHKp2JTMwOGFzz3i40u8Yz3gXq2ZleqKjHg21pz+qDvCWGoy5EhfGGSxt1JcVTHxopFh1ivaB6YeODkqRMSIaUIodVArLXwvG/4QpX2By7hADdp5pWLf0iatbvejV1K8xKRO2wxk7vPnfMqkCEt59A560cR2ffLjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707858; c=relaxed/simple;
	bh=keqHyOdOZOwQlgrReYoPFxFzA/8w5CidNqJNBoo8zhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnJpNz/v8tX1R81i0rADi7p9B6S2DM/P7dY+IUM8Th3duUnBoazO0GmtV2/8BCR8f4N4joJEBh2SxegkIPXIuOZ57KjWY+L3w4A+nyWr39nxY9bgWb9AZy7H8cXRNhIqwHo0ifXtlbKZ0D0u6Q/KDB1fek09OifE84gYUhdyWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6bCpPYL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6bCpPYL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a7dc13aabso1786723a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Jun 2024 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717707855; x=1718312655; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=keqHyOdOZOwQlgrReYoPFxFzA/8w5CidNqJNBoo8zhU=;
        b=F6bCpPYLjeUYOrspMZF8Ed39T5S9tSM1X1FGz7lTm9YrcbfWnNw8k+oa9Fv7PTVHvv
         jyMxu/+8QMkHsySIt+Mu0XX1Xn658E9cLATYXqsMPMuNf/KSdAJBq9W5MH5U8tuCs7qe
         sByfEhqBwdmEDIymilLmhP3fyv4sB+HoHKxMQHUsWRUZtw3yn22MeH7YL+8rb37ypfq/
         RMfwDMpbt8+QjGgIYgJBC78O7y9tI86TgmeYg+WQ0MPO6t3KCjMSZMkLJMIyvNc2Db4S
         AIw3at95vRuksLaqJIXtNz8/xopWaVT9dulDPxZinAw0fFVhKyuQWn4yDWA0xWwSkMtE
         5WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717707855; x=1718312655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keqHyOdOZOwQlgrReYoPFxFzA/8w5CidNqJNBoo8zhU=;
        b=GTKjF1EKVq9E2obJoky4imsk3MwVGl3lh97vmStmrtXEvUV5v1GxL1gSZbzGroWPqO
         FctBDzrxuevOCfaWvKB6N5NHbD0oFgP3ocFUTOXxrgfBQ8X/cYAmkk4hcyOf4iCMIPGv
         G0Ai9MvhCCS8nCgBuCSRmu6Ex3/TJsP8dd5CaBNusfWwfW6uiOaAmjGlmVwm/rPs+Aa/
         Wpo5A/aCe3/WeT2lOpsrpW1B+J/iRF9aUD+AS1/pgD0qfvIRRFdhWMCFJu2KvuYY2LSw
         +M48QPHfaT+A0B/tLt9EbMI+ZR767ZvGHaQ8q3IA4UOJIcr2qUawLBXSpG21tSWZRhLB
         paVw==
X-Forwarded-Encrypted: i=1; AJvYcCVRyX06rJb1ca0CM8MZ2YJ42iqjWi5B7hDxAbfzB3P1YBDPgVZvVlRtJpJ/SEen/kVtz7unMRB/yVOGj4zVmB6azdBdaJQe8Z9p1YjilzJKeQ==
X-Gm-Message-State: AOJu0YyGkJkq+jIKsFIfebdnRzOSolNujxtBjLwUyo4pPkobxAwzoXXN
	CXP57Rig5OE+bqN1feTDJwsZpXbQKolZpld/WZ8+WKngdmcWVRwdusO3kyglUqPE5d9567/4Pl/
	bUlppfO4gdiGXgj5yUhe75fGV7YHmf6ZzPtQ0pQ==
X-Google-Smtp-Source: AGHT+IG2Dcfh1F6YQ6OimrrH2CnVwHu7YNWHrj7TTURR7AB/btLmExEwVjIwWGrAUhwqk8yw9zkUfG5ST1NPvx1G1f0=
X-Received: by 2002:a50:931e:0:b0:57a:4ee0:8144 with SMTP id
 4fb4d7f45d1cf-57c50827346mr239799a12.4.1717707855180; Thu, 06 Jun 2024
 14:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603203437.973009-1-tanmay.shah@amd.com> <chqsvuwi7gukbw3l2y6xoxmd3lh6vlqhs2wjd4lylbhsg5m2hc@vnmesij3xoiu>
 <4b401ee7-73b8-4974-848c-5a181c0bdb81@amd.com>
In-Reply-To: <4b401ee7-73b8-4974-848c-5a181c0bdb81@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 6 Jun 2024 15:04:03 -0600
Message-ID: <CANLsYky3f9cw-nY2Q--uniB4k1QfHkCy8JLi+XcaxYZKHw8jnw@mail.gmail.com>
Subject: Re: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 11:47, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
>
> On 6/4/24 3:23 PM, Bjorn Andersson wrote:
> > On Mon, Jun 03, 2024 at 01:34:38PM -0700, Tanmay Shah wrote:
> >> It is possible that remote processor is already running before
> >> linux boot or remoteproc platform driver probe. Implement required
> >> remoteproc framework ops to provide resource table address and
> >> connect or disconnect with remote processor in such case.
> >>
> >
> > I know if changes the current style for this driver, but could we drop
> > "drivers: " from the subject prefix, to align changes to this driver
> > with others?
> >
>
> Ack. Will be fixed. Is it convention not to have "drivers" ?

"drivers" is not needed.

> If so, from now on, I will format subject prefix: <subsystem>/<platform>:
>

That will be just fine.

> > Regards,
> > Bjorn
>

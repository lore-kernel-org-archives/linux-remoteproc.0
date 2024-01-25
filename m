Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759797319C
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Jan 2024 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196656; cv=none; b=PxDN8sikmirvZt6/CLtrzCCk4SetrYAr/M57oCgaKNpQG5dvJL1lGYBOwk/A5VPFa3nRXfIQo393DaWkzPfVNedjyDo7C6Ayh893MZh3jOnPGyCInCpZBQvoDOLW3ft0Hh4bmbQVovoCSifg6rrSztt5wcliMtqp0ClJQCnZUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196656; c=relaxed/simple;
	bh=s2E38LRCG9fYFAqqHzLsTsDGqfFyy31S/0VoI9gmVe4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=MTLeMJEOKaVC3Q5YD2UCUIErSiXqieiLA7qktYaxlCFlhttBGXJ6dFkl/f40NC7JYf7t35zYJzjZVPqeM9DtZwT0UR0QFjdacD1oAhurgqZnxtN8AyNuNxZ81RxgUUGCSU2qxSxPkYb7Zf6YdJO/UTjM9RA4ZeaUNdWsLhrgX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+CBtMW9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+CBtMW9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3367a304091so6938827f8f.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Jan 2024 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706196652; x=1706801452; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2E38LRCG9fYFAqqHzLsTsDGqfFyy31S/0VoI9gmVe4=;
        b=X+CBtMW97ivu1NRmVmqo9H2K3KwNyy2mtDyWW8cWNjwpMC0l1Ekw4BkAnyKEfG0xho
         yBOVYuJWVcWvt+YN7jlu0YNz5m3B4JZ6aA+V2t9+YFHx1KV2jHi+w+6maISKN/MO4tio
         FVx399mGhZmdfFTQ5UbNYvQS0aPbKDvYv+XO91oqLpwImYOx7kGzweaQwPbKuXpHVJn2
         RY1UWaw0AWRSkxaXLfx9ozG9cEk32I5h1BxPsXSXBNwFVIcB+R5ge9dCmVb6smDnWrVO
         PGoKXSYteFOG2HMC/qJZNNzZwa20tXThlLlTZ+iWUC+9CiUKhxFe8GGrC6u8Civ615Xr
         L1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196652; x=1706801452;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2E38LRCG9fYFAqqHzLsTsDGqfFyy31S/0VoI9gmVe4=;
        b=vvn6pfNNOGw8ElB8hSynw4NUsnJnvi6gRc74VJFLUYi3nJnIz6NoD6Jm0K90HdNSVz
         DfE1qYcvie87QeJl0f/GXU2wot9XtKRY7Vzp12V1IttR9SZYnUThDW2PqHgQTiwaOh5s
         HrPvz4j2GCtMfkPAiL3N/clF/F8Ops4eu4LRIcrDEwkd1v3YCLsXdZwEIiByUQcOcbuF
         ctgLBrL5KgQpA6XG8c3Ra7dqc5m9di2gnDQInjZeNoq/910E3MiAKIPWzcof6SqLiUq5
         Dfeyb4iOCk2WTOOvxqpFM+uOfTA1h7L9fRjFS9YdVhJTVKSCLQztZ+w7nNxBIdnPyMHd
         h3QA==
X-Gm-Message-State: AOJu0YyAaRf/pfSinX+/l0oKxP47rvTJD8HiJCJ3VlSLs1caqMdvIdsJ
	kruVfbZEn9xCOHcIrFXl0iXJvNl90Ypd6y33DlvKAILZgg1w4WuOjhdbsPOwx6htMRQt1MYoL6F
	mu7PoSfGWfdy4LOTL3jBtzJWnX/s6ePUtyMHuU7qb5UF4TI6o0DQ=
X-Google-Smtp-Source: AGHT+IGMcNXHN0mvoZP6QP8vfXkg8g9SpEMC3n0zPSuD+EYsRrfmM1jNDoq1fDBWmJC00/xt/897BJOoZrmp8i0Ivhw=
X-Received: by 2002:adf:ea47:0:b0:33a:9919:8533 with SMTP id
 j7-20020adfea47000000b0033a99198533mr421099wrn.29.1706196652264; Thu, 25 Jan
 2024 07:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 25 Jan 2024 08:30:41 -0700
Message-ID: <CANLsYkwr5WW-HKOxtmK26YoGmzpeTPDZRXGbZDCtRpsTeASyqg@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for January 25th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v2 0/4] Introduction of a remoteproc tee to load signed firmware
[PATCH 70/82] remoteproc: Refactor intentional wrap-around test
[PATCH 1/8] remoteproc: k3-dsp: Use devm_rproc_alloc() helper
[PATCH 1/9] remoteproc: XYZ: Use devm_rproc_alloc() helper

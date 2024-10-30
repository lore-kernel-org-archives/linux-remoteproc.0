Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A32141BD
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Oct 2024 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303888; cv=none; b=Sp/MS1KeplCTC6R7Dc69dnCMu5ClMUmIkfpPA6VnLknp99+6dPDjKM33R4g2FHpdzZrdX3XzzN0QQHftcr3THInSY59T8+XqPWPVwcwM4NHLWV6sc0fiQhXkNbeAk1o42Er5TNvWzW4zy93IlzGVasi+zpsErVkzG/hCKoCpoVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303888; c=relaxed/simple;
	bh=BjCJefXuKGolkb4FX1T/zCOEcg/7CTMgZ3cn9qflqzU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pMFOLyhYxccCag4UPWpFL3lmDYLJj4/7ZKa84yX9Q++e0zPZUwcOaNmyNgxpKwa0/YtCGHXViQiJxAYj4/Q1jIXbkRX8gJwppr+ihDZvJ1Duj1BaLMBBt8xZ8hozzYoPBrQ+2qAD3ftUytHmlBrdSrLFBOgzOPENdp3PEdSfHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXlTlVd4; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXlTlVd4"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb49510250so70117461fa.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Oct 2024 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730303884; x=1730908684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjCJefXuKGolkb4FX1T/zCOEcg/7CTMgZ3cn9qflqzU=;
        b=dXlTlVd4IAGS6RFU9sKOGkBgCKKUvNcrcznkVkOcaZMTzQLK6HgvxW7hZhYIMbdKAg
         cRyj/ymcHlQrE4cBr6Y+ujEEsN15P+mwAH6lxAuMkCf1akQ7Byysch8Vslh0sVwhN3te
         AdT1j/NeDRkcjbKt3JwneP5YCHzL8G9nXUOe/YCy9aofYxE1e19DbgHwVIBa0soFk5vf
         qXOupO3vvS/io1mcGeukjcAnyIFLbcvILL13CifZwKE1Sgc35z2GFng8iYF79NcQOHbv
         4Arrii1OTQtMyb0jKTjBqhpeve449/nbpvsQGBib9B4X/o00Jdla7X53j9khlZpfwPd6
         F0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303884; x=1730908684;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjCJefXuKGolkb4FX1T/zCOEcg/7CTMgZ3cn9qflqzU=;
        b=UNwmJKSB6uL8SiTxDzwaq/BhN432nraz7vFxxsPpxJ1rF+CQlBhnigKYKVZlQQWhO1
         e6csjmBbXLA/QpJKc/eZMOCUIHgPfpQCW6uwk6iJJf7OqGq/szXySH+rBwE6KCAoq8N/
         OaJaXpWNWmYxox0YxYEqF2CgQ+Z10HU5P7pvM3ZHktpwhf9T9af0g97ujW72zCS+Hk7C
         p9W21jdE6WEX9rkgehgiJPDVtHLWsUQoxrZIyakkHNq9Vr6ueHkD+AM0ChqWTjKNJ0XL
         hVv4tEsccYEXZzC8vfiFMEddSYyK3woP9Q+W+rw6EsBd9B45Vfx3vMfmv+JvtiuikkTg
         VKUA==
X-Gm-Message-State: AOJu0YzgK5hDhqsPzAlnlB09WH6D/gXdajdJM3V+RVugaJ+fDVJD0dUz
	oUiLVy1umQhju6kNxtEbzwhSLcib7GRrRS1sUw1vvSDVJ9764dmza5NDIzrThZAUd/jBW1y4LO2
	+vbcDWjH3kihPRl3PHIcJq7bRkX16rA3Do6rNFqyIWPcg38DLu34=
X-Google-Smtp-Source: AGHT+IG8Ag9wqbXu/IxZTZPptFweN3PxGQor8buaxjHZMxgQoM8Z592DLfOqRvz4kitk+o87o6EPMBSWBH8MyoKEtB4=
X-Received: by 2002:a2e:bc0b:0:b0:2fb:5d8a:4cd9 with SMTP id
 38308e7fff4ca-2fcbe089cedmr82861831fa.39.1730303883561; Wed, 30 Oct 2024
 08:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 30 Oct 2024 09:57:52 -0600
Message-ID: <CANLsYkwLe=d-_3JmefRSjB5wb6fBdM1ox1v0WBKx2pUsMrtXug@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for October 30th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v3] selftest: remoteproc: Add test for start/stop sequence
[PATCH V5] remoteproc: Documentation: update with details

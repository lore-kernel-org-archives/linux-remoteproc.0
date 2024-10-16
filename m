Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9214EC47
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729121108; cv=none; b=NoIUBgxkscT18UL720wBgPYgaKK3BQpHyidXvXFzBOo5Y0bmVs8mErfJA8o2sPBfF/ssZhabo94XGx1XxO0fsex3s9/YwwBSL00ouN7/ZL32jA/kIPEuMd3nmQgAB0brt88gr2EuKNR5WFVl/x72nEmnjCxsa9HpW9cnwtMVTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729121108; c=relaxed/simple;
	bh=lAqGxfKkIrmYPGNG8tfij+W+t+TiE7bnwzApnIw+TIo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YERY7yfOYTJptsGEK5nq1sCiNiKAuOelOrE1Pi0u2yYgnPPEqfLyAJgEiNzf0YwHg3Q/JXgbwHmrD4KDuEC8azrg9QxgnNqAAKbzru1rsM7tVGn1TtEIpZxHSAGRPcIWHk93Iih9uiieKMLYAEPVNXOS9Ku6eRwERC3McF8bhaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKZ6y+Ep; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKZ6y+Ep"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c942815197so208124a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729121104; x=1729725904; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lAqGxfKkIrmYPGNG8tfij+W+t+TiE7bnwzApnIw+TIo=;
        b=vKZ6y+EpaLKbWnZYunRtcXQ5qA9C0ltc9k39HPbMrRJ6wiRoDeJ6ahjW2em3tEB0yK
         KfL8O11eekb2svsawj6EQmRo+hDvMaq/opHkHodXTaQOm5a475cEB1JLp9qPCR6+On5H
         u6bTx6KDySPWRdSkONGumBk6G+lkg+PgTQG+xKS3gIyOLqUAvelGSq5WJ/ydAejYn+y9
         P1F3WNa3oMFMSYPUWiHpByjB9bHsGmTqX8qF0mu4HgL/dhFq7Q4vJ53LS4NZ0ZD7CFJO
         yG97FfRUpCak2BYszW7By6GvwXjt/Jd/ldRIxKxZGpaSt/UBai0lHF3gTVlXAO/Xq1zj
         Mk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729121104; x=1729725904;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAqGxfKkIrmYPGNG8tfij+W+t+TiE7bnwzApnIw+TIo=;
        b=H9ks0zpd2yfBuIVfsOFvjdjZZFncfy2XVDRv5VykH3NhYGecG+e5Dff6GXl1OCMSfq
         Yx6uPiFmcQXw5vOG83sux9Mf3luk0la+dSaap3gd7EGCqvkmuUBy7ak4oG22+VWb7mKU
         GSF9sCZE0Aq7zE0oF2Rx21baYvYBdISSfKm/Tmw2LnegnajE9zo3c4VFLUqP/ePbhLuy
         B9qjmKjCNqFOL5GLIgbo9h6uoulisWLvYm/8Iso8IGQ8jj7EbWRPI2FpXQ9ZbAOhcAh/
         HYzu/6Zd0bCJCLQlGnkLsKLeWAJZ20tJIN1Dp86jEOZ+4Jd6QeugGS52BERXg9ap1xTG
         nWWg==
X-Gm-Message-State: AOJu0YyjXk4PV1xb36kKYXVLR95mpknxyd3hoMoMKgUn/L4OWmzMBGrA
	DFTz00puiA2MgPd/GA2PU3jsTPrzu31n6on/cBpOCC9Bibfzl4H68cWqfiRlXam3yW1ufyA/dLs
	KaGzHsjqTtWKRskyNokfNwVSRikbHc4T9ZNHKqcqnXDGNM+DKYQA=
X-Google-Smtp-Source: AGHT+IFVGOQelLHMZlT//eA4k/JOPZZr17A1vMMVCKHOXSOI8WXsEFErqer7UXNmJzeStNKAK8yRSqnZpj5oDvbyfMM=
X-Received: by 2002:a05:6402:340a:b0:5c9:288d:d6c3 with SMTP id
 4fb4d7f45d1cf-5c95ac63be5mr17506910a12.31.1729121104055; Wed, 16 Oct 2024
 16:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 16 Oct 2024 17:24:52 -0600
Message-ID: <CANLsYkzt-FPoShZjvfX2rcJsHv+-jC9wYQRqMbDu4K32g2JYLg@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for October 16th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH 0/2] Enable compile testing for K3 RemoteProc drivers
[PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
[PATCH v11 0/7] Introduction of a remoteproc tee to load signed firmware

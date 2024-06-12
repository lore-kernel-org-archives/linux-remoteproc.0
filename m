Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C61822EC
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jun 2024 17:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214733; cv=none; b=FA+85zoj2YFa9OIarzQb2znhz8+yX4yK99LNqB0j3vceNoX8AVJUkF4CrXk9phldE2yyGhMPD8EOR7k1UgAM5jbNp0MlmqmeRElUx7AK+qBOQ7EGRunYHLv3QYCeBOduCEkfDg5GCHDGW1hQoVJdo7X7VL2jIepelswruYPPnGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214733; c=relaxed/simple;
	bh=71z4lSuFwNHKssZlyb2cNdTi+QTig7VfmshKJzakWT8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hA237TvqVTc05/2az2pC/xdv1BaGVLBPPEB0fSdWtD/R9RaucQ90/Rbi5F4tPCYbxDV3b+ytLnt4aKPxsYbzsgnzKJcGwx+Hn2OTWWQ1QNxXJeTlSwES9UFLcYRq0eBW1yDM6//YDUM49WkKXQ4y761Up73PUEPvIIgwhpgEWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDIynyyP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDIynyyP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c8353d8d0so10614a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jun 2024 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718214729; x=1718819529; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=71z4lSuFwNHKssZlyb2cNdTi+QTig7VfmshKJzakWT8=;
        b=EDIynyyP6W+K/iAqPMC9j71a3oKrBBARQTNssb0VxK8GJH5c3lO+3gHmpiMFM9OPj8
         AqIbQA8+ZOa4ScqWmUvGR1VbhgldoEUvLVC8u+7MtwJd/1Qh9CTA5pCgfoZGwu0PFUoS
         yJMNllg3xwJJV/OWfZ41sInAvzP7s2BHsWStB4x1YRopHUfYbT9Ag+axJnScR7+PJVOT
         USagliB6muGY522Supw268fPF62bjK01DO7mfIwtRW1JnHxr7PBhcp/JTQaFvDHptcv9
         qIQcezIPUc5WEEPyTw1Qvd9HqUncmgAo5zhNSB/1PBqyRokU2OM9hil8XdQFiZ83j9UA
         KQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718214729; x=1718819529;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71z4lSuFwNHKssZlyb2cNdTi+QTig7VfmshKJzakWT8=;
        b=paUD4TKyBgOdoNl7XGf4dm9yy+P1tpfF0FrPB/HZ5ZcRkOTL4nyvPzVNU5zsm+JUmg
         IRuqJwJUBx1WfBqyAZgxilt86Q4XHgWcQ3eLhFs1DLbUDgleJZSzn07MVvNw+OTUvqno
         rGBw/XweFE51WCGe7GMD1ox5Nfb49COFrN73RyOJx7RYAwwUHABwUsYaP1tkwuuiSRpb
         oxPP8oE+yLSEy7X/6QaGbh7bG2ollq6daqNiZZsr45ffa6e35T5GFlNZ6thq6TQV6IA8
         64YagTRmBc6Hivu1nIB2ZQ6tvX5kiiWkJ+fEyNO5RIhofEDyDNuPblbAEVDzgLHuxgnL
         rEiw==
X-Gm-Message-State: AOJu0YxevncpFdQ4CmQmRcqQiaimoUORvR3J61RRgeMKd6qMPn5bSllS
	V2ukfEfAXG5ffXHiY/BFb2TUgr9j6aTN+Xp66CU6GwZGh2z+xxiLP0h31NDXCHLKl8rnc3PYq2b
	+flV9cdxUVT+V9zQIkdptbUuPrtobI+S7FWwV+V2Kb2brzaB7MZA=
X-Google-Smtp-Source: AGHT+IGhGN+48nIQZw7AuDpZqZuJar3RmdrX00mRgQcuw6gQxUGYjduCBbB2HPQ9sBbnCJjEHrcP5wwNSwyO5qEfoNY=
X-Received: by 2002:a50:d591:0:b0:57c:6d58:e1f1 with SMTP id
 4fb4d7f45d1cf-57ca9756c91mr1582848a12.9.1718214729343; Wed, 12 Jun 2024
 10:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 12 Jun 2024 11:51:56 -0600
Message-ID: <CANLsYkzDv0xhE1=CZkxSorohMTcOF==PviPgr1z5ndFTRfaZKA@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for June 12th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v3 1/1] dt-bindings: remoteproc: imx_rproc: add minItems for power-domain
[PATCH v5] remoteproc: xlnx: add attach detach support
[PATCH v10 0/8] TI K3 M4F support on AM62 and AM64 SoCs
[PATCH v7 0/5] Introduction of a remoteproc tee to load signed firmware
[PATCH] remoteproc: imx_rproc: Fix refcount mistake in imx_rproc_addr_init

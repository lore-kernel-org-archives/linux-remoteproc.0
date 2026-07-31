Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74323537F5;
	Fri, 31 Jul 2026 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468404; cv=none; b=kZTOMcPOsbRQvH7WCZN+kSW9t1lzBm0Z0yJGLNlPQ6UN8vSeUVW2fSz0QuWoNz0VXQaYw9YzFaVbX+whQS/zQ8gPmGA/OPBKNflKGIdSBdpbGXaVltrK8yci5/qVwJZ6lAmTr0QnkpacvuYSyao/5+bDarlUjPhwwFQzZrAwheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468404; c=relaxed/simple;
	bh=8cDalrHEpPaOFSbL/yJIPrU3MFGgGKqakWJthBaHwPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqBnaChbO4yey35JH21jL82j5PtliYlPD7QQqVskqtckWDoukSILBjhDJ7WTTNhvp9XIVrYgKUhtPZNZ++oHHjaO+Lpt2EUAg1HqXKzKx5/5opwjHf7BY2SqPzwmUK1WD/zr3o4tZlitGlH5gWcGFSwluimLQV7Fih/g5+O70k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjfT+sO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjfT+sO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067971F00A3E;
	Fri, 31 Jul 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468403;
	bh=PjoXcQE3oFcBUeFtU2io/jWZE6F2tPjjLg5xw19ogoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EjfT+sO8VorIbuBLkBga17LlKRM9Yrq5xUfCQ262PpoKHGlaghUbPhA8MkFM8jzc4
	 FvcXnWPR2Nku1akhCRIPpA+Rteqt4VOOsJGjMn5hhKK92Iig9hwJvsZm/NCGfU/vAz
	 xCuGSWDzW7nXKMffyRH/70zDq7fNRVLa/yXMgnpUGFHJqs2MPBgJlL62kSONKrAOwK
	 i+H3KfcoFGk0jvEUfKWW+Qu6hP9+t4f7TAK8pD2ylKdaOEiXEIGUFQY0WwPJsQ9k0x
	 Fk6gJkT6OFzfw7Ig0dh28l+6hqhC33sikjH+VGK4mw7VSmGLdECUrzVYkc1bTTw8uA
	 1CVkKoK+Kvwow==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/6] remoteproc: qcom: pas: Misc fixes
Date: Thu, 30 Jul 2026 22:26:35 -0500
Message-ID: <178546838833.317434.6386548960843865759.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 23:58:52 +0530, Mukesh Ojha wrote:
> This series is a collection of misc fixes for the Qualcomm PAS remoteproc
> driver and its supporting SCM/MDT loader infrastructure.
> 
> - Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
>   annotating mem_region fields with __iomem and using __force at call sites.
> - Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
>   consistent with all other release sites in the driver.
> - Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
>   so the DTB context is only created for subsystems that actually use it.
> - Map/unmap the subsystem memory region on demand around firmware load and
>   coredump, avoiding potential XPU violations on EL2 platforms where the
>   region may be handed off to the remote side.
> - Drop the now-unused dtb_mem_region field from struct qcom_pas.
> - Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
>   buffer retention explicit rather than implicit.
> 
> [...]

Applied, thanks!

[1/6] remoteproc: qcom: annotate mem_region fields with __iomem
      commit: 142044ea7bbb83c180319368a8ba088452ceb7f5
[2/6] remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
      commit: c06c5ab4945392d2c2aded6d832ab6b58cabe351
[3/6] remoteproc: qcom: pas: Fix the PAS context creation placement
      commit: a5464fa3173c83da28b46e3c12be6d4a27bf5728
[4/6] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
      commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb
[5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region field
      commit: d402a23bf4337a5050306847ea19e1bdd8e05736

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

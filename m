Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404A37B012;
	Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706839; cv=none; b=C6wYNHDEq3Pl9r7dlho4WSznCYi7DCPJrQFSSNHiHyPMj07LFe99bLEFxN5cNrfwVzj6QDfSJ+l5Ow2xDqtCATdGG6dFv/N0NEmyXNEPc8pZa0JxEuDHmN6f9zfzVZ7TaJeYObA4KdjxmnpSdJ7e7+wxwRsxqxyB/SNEuv+7ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706839; c=relaxed/simple;
	bh=OtkX6ASGW9e01cJh5zHqePef5qHIAj2Uvr9j5bUarmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+OIvkBMLYKFDc6RkLbkVmL43/gmK0gUJrLK2wl5IK+gnoTIoAYa8Zo7UkI4M210uiK2r3fY+K8HPQYM1w1afYxL9FQgl5bqWkm2Id4LA8UQUKhz6gsp02c1y70g46rbofyywuDuRubURVSUhmVPdzfyBQmcSev0eAwzqH1Hwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnZJCp5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnZJCp5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23971F000E9;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706838;
	bh=KvfHhmaWu2O0Zfch96SYtl3PC99iZbwOdKodTrKyi9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NnZJCp5Tu1eP/59Px3L/XsndcqnfPazSHZai/8ZrgR0D0C7sM1RAiuD3JK/TLqzZI
	 61bpwU9+GiamjGole3IXFMFAHHTuC6ny3q1uvbEPAUBl5nv9iammOI53QhJPtaRxLB
	 xwwJnmfDqYDeaoTLl/QQF+4vBHdF+7b4/t5Eqyc3rKKD7sF7q7Gl9By1cM16DeUIX2
	 tvfLCkVkFKIpFd+GyH/dHzw2ABLntCBLue/H9sKZSqODnwF8ff6OGhXS/ScvOG2cgp
	 /12Fl24dVO6WeQUb9jEGRly8vZ3ImnaivedokQgh8y9edsQHvC+QxPC3YEG9v8N62K
	 4PRhPbfnyaKfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Felix Gu <gu_0233@qq.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
Date: Fri, 10 Jul 2026 13:07:02 -0500
Message-ID: <178370682974.2572738.5764391250838504715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
References: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 16 Jan 2026 20:11:03 +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In adsp_map_carveout, it does not release the reference.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
      commit: 8c952807c2cebd5e9e9b37146c9383229794c129

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

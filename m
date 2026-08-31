Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680437E5F9;
	Mon, 31 Aug 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194938; cv=none; b=PauNcjA+yrHG+xeNWY35nW4wE3CZmjWlu6NLZ3FMsL0COiIL/cX7+D5fH1LyWHSHTh5cGiWcJfX/g23BOCoG3fHZwZGNId8pbNHXx8Xcdgl2jodPy4XgL9kvfcTf3Ae9ZtvNfRTw5yVa80L4CvDIHNZv1A/TEZcLDoPkaf+FH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194938; c=relaxed/simple;
	bh=tMqvzM+NtaDomdUobueJyQAk0vekXFDVCKXdce+Qo28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlA1am9gggpAKxt/RM6BQHzr/s0P41YF/EcaTMK/laAp/zHzb7UeIWmPMFutsu0bwuo5HVH3CtB09cARBR7s8Uf/sw4kQXgzXnwcpY8VYTLVKn/FXVxzU3kjLotmqCzJk1brGDHUXT1Hl//4HryI4GwdmKreTW6F7kNQ87kRD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2glTfmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2glTfmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055321F000E9;
	Mon, 31 Aug 2026 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194936;
	bh=vzmYtLl5bnZOyvIqYRapFlptSXbUlhDwouajn9hEDXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W2glTfmZaiCan90uw5FC3c4RvzK8rWr034AX38DzUkL4AG7pYytmfDNkvwV6U4LZK
	 fE17JFcS3JWoSAI6bl7fkJEAmMkTJmVdWgBsBp6NBme0sJ0ql4zGky6a9q51MMOL/w
	 +za2w6/gIRKrCixnikIKjDNsyaGRfK/Qltsolq4qu+3Z+WzZMg8WGEtVWDgypJaI/O
	 5k8i9nu4AIfBmUclVqS9r1uEwKOpUXD21Bnyzg1Hf/UoDdhUU9VKSSaJDxF7NgBfxy
	 ZrPDDMD9/ohkkz+FNck0TdtgjZhyMiBy9RE06+bQKUKhxAkncCq1/gC1mBg/3D6DTS
	 +SUpKFXDPpDQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rohit kumar <rohitkr@codeaurora.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_adsp: Fix double jiffies conversion in adsp_start()
Date: Mon, 31 Aug 2026 11:48:47 -0500
Message-ID: <178819492777.1319417.13157039707797004081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-b4-adsp_start_jiffies_fix_upstream-v1-1-9f8cf85ea220@oss.qualcomm.com>
References: <20260831-b4-adsp_start_jiffies_fix_upstream-v1-1-9f8cf85ea220@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 18:09:08 +0530, Anup Vishwakarma wrote:
> adsp_start() computes 5 * HZ, an already-converted jiffies count, and
> passes it into msecs_to_jiffies(), which expects milliseconds --
> reinterpreting the value and shrinking the intended timeout. Every
> other caller (q6v5_start() in qcom_q6v5_mss.c, qcom_pas_start() in
> qcom_q6v5_pas.c) passes msecs_to_jiffies(5000) directly, matching
> qcom_q6v5_wait_for_start()'s kerneldoc, which documents @timeout as
> already being in jiffies.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_adsp: Fix double jiffies conversion in adsp_start()
      commit: f559ef6316971fe39dc5f5edd6a483429ba03768

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

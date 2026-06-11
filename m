Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22D2741A0;
	Thu, 11 Jun 2026 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142476; cv=none; b=HdATBhnBh8aJjyfUiUuMZxGP1QxaACfJZjY9cusbJZ++wnpcdl5pq0QcG2eSSJxLZgqNpJzVGEq7lQAC4alqhVXU5sJIszJQwKSqvk5Sspse0uyEbuUqK+DQs0kagGuTyvor6dwSpzl0eYa/3c3hZfwi4HFET19QvF8+/Ojp490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142476; c=relaxed/simple;
	bh=rAhb39u9QZvEKxjs9oKA64JovthYCd5xBfVi3or0h3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtWfy+V3SA5EcUn+/hkwnTF5gYaLLNVXTmXGaURcQ6XKYTfvdBGzmgwl3bfRJcqu4+DDaRGfxFzbzD6qlUGzT/yCC6m+Fh2LALo9TrIMF/JzS4XH5Pxz+yUV8H+Qh7K33LoLDvsmaKiA5shfub9RFqy5+wjSUdN4OJfiT432mRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIDZsJbp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIDZsJbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FF91F0089B;
	Thu, 11 Jun 2026 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142475;
	bh=XC05i+af99NTYBwNg6ZIfHhf7xZjSmMYHAL2kEdBdq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lIDZsJbpg3frgwwyV5BJrNjPa3dv13xaKM7OrfLDlGTPFbgJWqD/ZKD6oXAa4PQXB
	 g0bYyJ1MjraqqLVkcXflCicbyF04KfMiSWF/hRjQBZPGWE8JtQBU6HMLolRr+wKxjh
	 Nhe3IfKRSvz7Ocbv6xTxFDc/luYLep1P3SxLbGOmdCKFBUbrhMCN6zaaw3Lx5lOC/5
	 DNnz5nTvd+fJtmp9aufhkdOgEGGg0EfgqL7efebiUpFvcSDpLfe5pXDxR/cTw2N7HA
	 R1mi9Hgpjgs25NMBCLoUw0ev62zbd44plovHUIUl+x4Vyj2hzBBMbqVvNdr9aMcE9z
	 OeuCj7BBOEibg==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
Date: Wed, 10 Jun 2026 20:47:44 -0500
Message-ID: <178114245724.590736.3178574544251384393.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
References: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 May 2026 15:38:36 +0800, Shawn Guo wrote:
> The completion start_done and stop_done are leftover from commit
> 6103b1a616ab ("remoteproc: qcom: adsp: Use common q6v5 helpers").
> Clean them up.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
      commit: b5bfc7d039bb775730186a9c38d0f01afd729638

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

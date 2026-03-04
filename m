Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83A3D6CCA;
	Wed,  4 Mar 2026 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652442; cv=none; b=nR8p1uZeIrBeu3dhAWngBOPUWhzr/nKp8rsY5n1IdAjTq9jZxc5rBMDe14/lgWcL4B8X+ocbML5WRab5u62ANR7O2UiuPpaq+ejNb9lJd8mwi6Op+kqzULlcDniewGa526BesT1hPY4QWYLsFyUbGd0n3resVEvhbESgiCjVOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652442; c=relaxed/simple;
	bh=ucmwUtQTpikcb1mLNt7L+nzR/8KKJlj+msH+B16mj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0l2s2FipTbvCF6HCdNPuEuLvPEAfwERgQRV/ROucqyCUiAPGOVOHxatLk/fOlniK1/rky11hKTP6CZ2Ruy5d4jWe7AmKlMeR0kn6khZ1r131c4cJuPGo+bui/B3eY0/dj6cRZhpnBmJux8Lbhle81rfMw2xS19mNSDDJnIEhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcmEx/Aq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcmEx/Aq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1720AC2BC86;
	Wed,  4 Mar 2026 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772652442;
	bh=ucmwUtQTpikcb1mLNt7L+nzR/8KKJlj+msH+B16mj9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RcmEx/AqyLBL63emDAQt3vUGckEnd0GZ2lXq238tiNsOg4jWDmlaz31plbhXmV+Dx
	 4VUVv8nWl+yUD+F80krjtfqdlGvoSwQtGKPEXOw6LGnm6bEnjE8pFtOqwAYrmarB6i
	 +TeSM+iyI15IlLzNv7FjTSlfKw4X/TfXTNcuqBbkSLUW2Dg/7CzEBXAy/3UqkYK1k0
	 9O57EtILp/Q43I90Rj0rQxI3PBsoaSi8KYTPSrDtOFii56XMx45cLsXPbOCPyfZXSn
	 5M8VP+hPJe66abZBdGkOvk1obrUwp67t+voqovUlCqMImLfA/yn73JAiNd3duz3FXW
	 hB422HFsqTjIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: sysmon: Correct subsys_name_len type in QMI request
Date: Wed,  4 Mar 2026 13:27:05 -0600
Message-ID: <177265242140.5575.13390917589462432936.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
References: <20260220-qmi-encode-invalid-length-v2-1-5674be35ab29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Feb 2026 15:11:48 -0600, Bjorn Andersson wrote:
> The QMI message encoder has up until recently read a single byte (as
> elem_size == 1), but with the introduction of big endian support it's
> become apparent that this field is expected to be a full u32 -
> regardless of the size of the length in the encoded message (which is
> what elem_size specifies).
> 
> The result is that the encoder now reads past the length byte and
> rejects the unreasonably large length formed when including the
> following 3 bytes from the subsys_name array.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: sysmon: Correct subsys_name_len type in QMI request
      commit: da994db94e60f9a9411108ddf4d1836147ad4c9c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

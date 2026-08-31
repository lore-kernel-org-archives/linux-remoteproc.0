Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F33803C2;
	Mon, 31 Aug 2026 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194942; cv=none; b=rx8Rfq3vVswy9E6pX9OTTkDMM7WUA+sov2fqiSN6E7JPEmZJWzr8hCxhc6zut8EpnezdNb9q/Acp1+qRrOovtvdyTq80Sam7ShNQPlYkJOUeTIDykIOG8C6EawqSKr8fhSNj69jb5QupgbHM1dQqXZ9vcFv9MIvhdDaI/cDDSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194942; c=relaxed/simple;
	bh=zOOIMdM1klzMNOs5TJyKUqXl3NTNigb9NRp5spCnGpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9Lk8MCcFHhLEvfeO+grbB7f1exjTVAj6jZ5hOvm+BY+WgvsDMuo4RRaOXC/XvS2VBAxO3i4hmc6rcdC7tHYURaNzRjOgU0ZDNy0tV+5H6iq2Y9hP3eOk15F7tPi/Z6RL4affb2jMq2MAjBsi22a8dpnvpAXI6OGcuOEg4EW8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLp/NmwI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLp/NmwI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC5F1F00A3D;
	Mon, 31 Aug 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194940;
	bh=rw7luT/IeyftNDEBEVjmYgE0j0ygqs8r0hiMXZzI8NI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TLp/NmwIlr2tAddRKlOfrnJl0HtczZgSJFkAXvu1uNnuC7hZVEK2xidMKWZ6wCAxS
	 OG5jJiJ5tUj7pMA9teqgTEBEc2B5v7+b7FC3VzsA/7phkSxa6/vrhnpPZPggmkihmr
	 9kZiz6JodfAxs/Veel8HCtgyFnXLeYfLVP9/XqSPLnBMyBtU+W2jeCLPXCMBlmlnur
	 opJf+8mYA3+pctfW/6Firvka8taP0Vy3dx6E0Vy+ZMDIpPtC3ceLS9yeTiD/4Ygkh/
	 DdVcjCVN+cbq0GyVJmygAe2SEx1mFJG6GqMSDdK6GasrSCgVIqLjORQ1mtbjw2nMiC
	 3RYpQXsA2Mzkg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mostafa Saleh <smostafa@google.com>
Cc: mathieu.poirier@linaro.org,
	quic_srivasam@quicinc.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
Date: Mon, 31 Aug 2026 11:48:51 -0500
Message-ID: <178819492787.1319417.4343430940727987436.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827203055.640116-1-smostafa@google.com>
References: <20260827203055.640116-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 20:30:55 +0000, Mostafa Saleh wrote:
> During adsp_map_carveout, the IOVA is computed by combining the
> physical address and the SID:
>     iova = adsp->mem_phys | (sid << 32);
> 
> However, adsp_unmap_carveout() uses the physical address and not
> the IOVA in iommu_unmap(), causing the unmap to fail or leak
> mappings because the address doesn't match the original IOVA.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
      commit: 0d8e2195bce6f08c1c53c5ef4d7347fe46418101

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

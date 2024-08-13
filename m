Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84467AD2D;
	Tue, 13 Aug 2024 01:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723513569; cv=none; b=YBbCwhYHn3xUetrEgcD4xQ5wwQRfS1fn9buNvN86ZfZrvx9DQNOkNMfecswrmCEcRXyTRqh7PgqOX//+DvDeJWJJW+54oU3q/m3mG+a/oc0em2JWDpWjK1hs1aMPoPUI274VnMGffcvTSupAST8sk8w34fAkdSFjHvpX0RDErh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723513569; c=relaxed/simple;
	bh=BXkWJmjVXALTuKHM8ZDQSMyOXuekJyRA6yOcpawOcrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEBeE28fww4/3MTPz68iDA1GlKu9rUQkn6ZKp+EFc2F+dJyecPWA2wpHg0BPZG97tIbeTibDgxCxc26HTxGxGzgD0gpsdEf8tvO8nQT6klh/bDjYymfATQ1yu86AWX9EbzsBPGJKbjjAlmNffCgL7bNK+Ro18s4OwhaeHLB4uUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpsPSyPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpsPSyPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224A5C4AF0D;
	Tue, 13 Aug 2024 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513569;
	bh=BXkWJmjVXALTuKHM8ZDQSMyOXuekJyRA6yOcpawOcrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpsPSyPh+HFuKDStJU2NLVQS5JrhRJ+IiLX5hXMPWHz74plx8V60Ku+W2pfHyYg7E
	 SXobr0/z9IKYNsN6Lws572X8OirCz19DE8H33I3Tg580KdfvAiBsHxlnFSBjvQqE3V
	 lpnb7wdTRy0rtviaMA+QO57C27g+2YTJ6/h4nM78SnUPZUYlq6Aw0TMDVQAOL+u9e8
	 N3WNgUrBF3zCnzKB8Z54i40NngYumBTKAbx5wfkzlyQ3tWsZk7pRzFm4n0rRrZjKip
	 N8gnFuUNuTEvuaR8jt4CcHM1Nt+5lkr+Iry66TQjuYVbpJ8cWabXZLEQXu+wNtCmzc
	 JKstljAri8ubg==
From: Bjorn Andersson <andersson@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
Date: Mon, 12 Aug 2024 18:50:26 -0700
Message-ID: <172351382251.3412490.2523816032990287996.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ZrB2S71BsxGAVXfQ@standask-GA-A55M-S2HP>
References: <ZrB2S71BsxGAVXfQ@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Aug 2024 08:50:51 +0200, Stanislav Jakubek wrote:
> Convert the Spreadtrum hardware spinlock bindings to DT schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
      commit: 8dc1bffd6e15da727f7cd07e2d2e7aea728f42ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

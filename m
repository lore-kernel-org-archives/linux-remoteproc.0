Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168538;
	b=oq6/cUBbsAMkxgCgVhhX77dHz08rObG4tHmSykppJj6HCbs5V47HZQqQOvJtFGrbVQ/d
	 Zuh+g2CDWX8GcDNtLV+Z1aBDn47RC05HUBKj43fcGijP2aKgqSh9vSsgKZm3AJZmEdZUr
	 HSEqn9aMCksG/6dWHJz2WuuekiS9tPbIF8JfHGg+5OJPJQ3diEwClUcy4lM6fwtNOH6I6
	 upBxTWu21oajGBesfvqzeKz5uyzsRskq5M9PgO1RGUsUBa3evfSytjI4hy8YIG+If4lSj
	 zHoZt2TTCRvE58Ui8Fk6RD40s/nNmZvLW0oI9FGB7w39MJTLKVhyfqTuQvBHG3VJ9Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168538;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=d+tZIlQKNZ+yu6gRCGjKW8er8h0cHUE3j5TLZpuRggk=;
	b=fy/qdN9teTFl4Dpc4xlM3CpTvfj7OpxGzEeAxZBUTyoU2gKkaJFE6DJe+SdAFUjtrazE
	 SDHQb3zxF4oB+qzIUrCUoglw6baeuCOyEYa4EQp/Wz6pBKskI1afE5d6CvyEAccBl5gT5
	 6fmBPL9bVi0ttKAIerT0DcE8ui/RDfEBc3bjYMQLfg7ArdEGCzEHRIUZkTazOQSJ1bbRA
	 9be01mRepk4eAqbvHRu86wWP6I2CiRnsefOPhN/t9/YDcoQLz9CNaNaGtRcqxgqGEm+4a
	 J73ABOoorkvyBHxOnufE6GlqttEHTjcq6/98LRnoZyEmD6pcymwYZTq1TutxkN6NHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVjvcjuh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC588606EE81;
	Sun,  8 Nov 2026 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVjvcjuh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A162A1F00903;
	Sun,  8 Nov 2026 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794168537;
	bh=d+tZIlQKNZ+yu6gRCGjKW8er8h0cHUE3j5TLZpuRggk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bVjvcjuhIH4ut+5CQroI2I/Tz9rfFOoh9f1IsQjjJRvjo+fXrcBbN2covD7p970lh
	 CGBrHFTAJ0NPvewCOvvGWIl0MyfH2PlIlWasKTfxMrJoyYzegX/Y/pnz8syPqah7CO
	 kqZ077vKsNDSYX1kla/PvZi5KwwHnQJ2SAksx8j8CUjwnAfKiFZHyZuAkbXnVHjZLN
	 +wYXEDUXWcuOiypf7GFoXdc9v3sgYE2LLPC3oq/1dNDYjqRMEieZaPWy8GIxvrrIEC
	 xvy1Hy8LWh8GNTjS1dgB5dZU9LUA+SKy4Aaban/5Up5zCLqkcNaxyMpUJNunHgc4wX
	 uJM81PZhoDgQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yuho Choi <oss.patchbox@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] remoteproc: qcom_q6v5_mss: Leak metadata buffer if reclaim fails
Date: Sun,  8 Nov 2026 14:08:43 -0600
Message-ID: <179416851785.24425.13282629078189913830.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105173336.32359-2-oss.patchbox@gmail.com>
References: <20261105173336.32359-2-oss.patchbox@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Nov 2026 12:32:24 -0500, Yuho Choi wrote:
> When the device tree describes no "metadata" memory region,
> q6v5_mpss_init_image() allocates the MPSS metadata buffer with
> dma_alloc_attrs(), assigns it to the modem and asks the MBA to
> authenticate it. It then calls q6v5_xfer_mem_ownership() again to
> assign the buffer back to HLOS.
> 
> If that second call fails, the buffer is still assigned to the modem,
> but the function only warns and then returns the buffer to the DMA
> allocator. The pages can then be reused by another part of the kernel
> while the modem can still access them.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: Leak metadata buffer if reclaim fails
      commit: 3f4f7571c001b04622be50c288c73ec8f320beca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

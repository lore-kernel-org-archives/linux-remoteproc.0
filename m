Return-Path: <BATV+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@bombadil.srs.infradead.org>
From: Christoph Hellwig <hch@lst.de>
Subject: remove various dma_declare_coherent related exports
Date: Mon,  2 Sep 2019 22:07:42 +0200
Message-Id: <20190902200746.16185-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,

this is a refresh of and older series that tries to ensure that
drivers don't use the dma_declare_coherent function, which is
intende for platform code.  Unfortunately we've actually grown
a user in remoteproc since then.  While the maintainers havee
promised to fix that up that hasn't happened so far, so for now
this disabled the modular build for remoteproc until that has been
solved.

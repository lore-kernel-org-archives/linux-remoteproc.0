Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 15 Sep 2016 10:54:32 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 07/19] remoteproc: Add new resource type for resource
 table spare bytes
Message-ID: <20160915175432.GF21438@tuxbot>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-8-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472676622-32533-8-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 31 Aug 13:50 PDT 2016, Loic Pallardy wrote:

> To allow resource appending to an existing resource table,
> remoteproc framework should get information about resource
> table spare area. With current resource table construction,
> remoteproc is not able to identify by itself any free location.
> This patch introduces a new resource type named RSC_SPARE which
> allows firmware to define room for resource table extension.
> Defined spare area will be used by remtoreproc to extend resource
> table.
> 

We don't need a dummy type for keeping track of the available room in
the resource table in the loaded firmware. All we need to do is to look
at the sh_size of the .resource_table section, which actually is what's
returned in tablesz.

So the spare size is the difference between tablesz and the end of the
last resource and if you need you can pad this when composing the
firmware.

Regards,
Bjorn

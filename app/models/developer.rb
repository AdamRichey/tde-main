class Developer < ActiveRecord::Base
	validates :title, :first_name, :last_name, :developerpic, presence: true
	has_attached_file :developerpic, styles: { medium: "600x400>" }
  	validates_attachment_content_type :developerpic, content_type: /\Aimage\/.*\z/

	Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
